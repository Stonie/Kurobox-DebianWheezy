/*
 * uloader_mod.c
 *
 * Loads a RAM build of u-boot and starts it
 * The load address is hardcoded to 0x03f00000 (for LS HLAN)
 *
 * Copyright (C) 2006 Mihai Georgian <u-boot@linuxnotincluded.org.uk>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
 * MA 02111-1307 USA
 *
 * Based on:
 *   loader_mod.c by Chih-Chung Chang <jochang@gmail.com>
 */
#include <linux/module.h>
#include <linux/kernel.h>
#include <asm/uaccess.h>
#include <linux/file.h>
#include <linux/mm.h>
#include <linux/vmalloc.h>
#include <linux/slab.h>
#include <linux/reboot.h>

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Mihai Georgian <u-boot@linuxnotincluded.org.uk>");
MODULE_PARM(uboot, "s");
MODULE_PARM(laddr, "l");
MODULE_PARM_DESC(uboot, "u-boot file name (must be binary)");
MODULE_PARM_DESC(laddr, "u-boot load address");

static char* uboot = "u-boot.bin";
static unsigned long laddr = 0x03f00000;

#define LOW_MEM 0x800000  /* no smaller than kernel + 1M (bss) + initrd */

void load_uboot(unsigned long pa_load_uboot,
                unsigned long pa_uboot_buf,
                unsigned long laddr);

struct indirect_buffer {
  int size;
  unsigned long paddr[1]; /* physical address of each 4K page */
                          /* terminate with zero */
};
static struct indirect_buffer *uboot_buf;

static int uloader_notify_reboot (struct notifier_block *this, \
                                  unsigned long event, void *x);
static struct notifier_block uloader_notifier = {
  uloader_notify_reboot,
  NULL,
  0
};

#define MAX_INDIRECT_BUFFER_SIZE ((PAGE_SIZE/4-1)*PAGE_SIZE)

/*
 *  Allocate a page with physical address >= LOWMEM
 */
static void **save;
static int saved_pages;
static void *alloc_high_page(void)
{
  void *ptr;
  if(!save)
  {
    save = vmalloc(((LOW_MEM+PAGE_SIZE-1)/PAGE_SIZE)*4);
    if(!save) return 0;
  }

  while(1)
  {
    ptr = kmalloc(PAGE_SIZE, GFP_KERNEL);
    if(!ptr) return 0;
    if(__pa(ptr) >= LOW_MEM) break;
    save[saved_pages++] = ptr;
  }
  return ptr;
}

static void free_saved_pages(void)
{
  if(save)
  {
    int i;
    for(i=0;i<saved_pages;i++)
      kfree(save[i]);
    vfree(save);
  }
}

static void free_ibuffer(struct indirect_buffer *ibuf);

/*
 *  Read input file into an indirect buffer
 */
static int read_file(char *filename, struct indirect_buffer **indirect_buf)
{
  struct file* file;
  struct inode* inode;
  struct indirect_buffer *ibuf;
  size_t size, got, i;
  mm_segment_t fs;
  int err;

  file = filp_open(filename, O_RDONLY, 0);
  if(IS_ERR(file))
    return PTR_ERR(file);

  err = -EIO;
  if(!file->f_op || !file->f_op->read)
    goto out;

  err = -EACCES;
  inode = file->f_dentry->d_inode;
  if(!S_ISREG(inode->i_mode))
    goto out;

  err = -ENOMEM;
  ibuf = (struct indirect_buffer*)alloc_high_page();
  if(!ibuf) goto out;
  memset(ibuf, 0, PAGE_SIZE);

  if(inode->i_size > MAX_INDIRECT_BUFFER_SIZE) goto out2;
  size = (size_t)inode->i_size;
  ibuf->size = size;

  for(i=0;i<size;i+=PAGE_SIZE)
  {
    size_t todo = min(size-i, (size_t)PAGE_SIZE);
    void *buf;

    err = -ENOMEM;
    buf = alloc_high_page();
    if(!buf) goto out2;
    ibuf->paddr[i/PAGE_SIZE] = __pa(buf);

    err = -EIO;
    file->f_pos = i;
    fs = get_fs();
    set_fs(KERNEL_DS);
    got = file->f_op->read(file, buf, todo, &file->f_pos);
    set_fs(fs);
    if(got != todo) goto out2;
  }

  *indirect_buf = ibuf;
  err = 0;

out:
  filp_close(file, NULL);
  return err;
out2:
  free_ibuffer(ibuf);
  goto out;
}

static void free_ibuffer(struct indirect_buffer *ibuf)
{
  int i;
  for(i=0;ibuf->paddr[i];i++)
    kfree((void *)__va(ibuf->paddr[i]));
  kfree(ibuf);
}

/* convert vmalloc'ed memory to physical address */
static unsigned long va2pa(void *p)
{
  return iopa((unsigned long)p);
}

static int uloader_notify_reboot (struct notifier_block *this, \
                                  unsigned long event, void *x)
{
  switch (event) {
    case SYS_RESTART:
      break;
    default:
      return NOTIFY_DONE;
  }

  printk(KERN_INFO "uloader module booting u-boot\n");

  load_uboot(va2pa(load_uboot), va2pa(uboot_buf), laddr);

  return NOTIFY_DONE;  /* This should never be reached */
}

int init_module(void)
{
  int err;

  printk(KERN_INFO "uloader module loaded\n");
  printk(KERN_INFO "uboot=%s\n", uboot);

  if((err = read_file(uboot, &uboot_buf)))
    goto out;
  register_reboot_notifier(&uloader_notifier);
  return 0;
out:
  free_saved_pages();
  return err;
}

void cleanup_module(void)
{
  printk(KERN_INFO "uloader module unloaded\n");
}
