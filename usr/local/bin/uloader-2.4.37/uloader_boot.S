/*
 * uloader_boot.S
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
 * Based on: arch/ppc/boot/sandpoint/head.S
 *           arch/ppc/kernel/head.S
 *           http://www-106.ibm.com/developerworks/library/pa-ppccache.html
 */

#define HID0        0x3F0       /* Hardware Implementation Register 0 */
#define HID0_ICE    (1<<15)     /* Instruction Cache Enable */
#define HID0_DCE    (1<<14)     /* Data Cache Enable */

.section ".text"
.globl load_uboot

load_uboot:
        /* save parameters */
        mr      r31,r3  /* pa_load_uboot */
        mr      r30,r4  /* pa_uboot_buf */
        mr      r29,r5  /* load_address */

        /* disable interrupts */
        mfmsr   r0
        rlwinm  r0,r0,0,17,15   /* clear MSR_EE in r0 */
        sync
        mtmsr   r0
        sync

        /* disable cache */
        bl      disable_cache

        /* jump to after_mmu_off */
        addi    r4,r31,after_mmu_off-load_uboot
        li      r3,0
        mtspr   SRR0,r4
        mtspr   SRR1,r3
        isync
        sync
        rfi

after_mmu_off:

        /* copy uboot image */
        mr	r4,r29          /* load address */
        addi    r30,r30,4       /* skip size */

2:      li      r0,1024
        lwz     r9,0(r30)

        mtctr   r0
1:      lwz     r0,0(r9)
        addi    r9,r9,4
        stw     r0,0(r4)
        addi    r4,r4,4
        bdnz    1b

        addi    r30,r30,4
        lwz     r0,0(r30)
        cmpwi   r0,0
        bne     2b

        /* jump to uboot */
        lis     r1,0x100        /* put stack at 16M */
        li      r3,0
        mr      r9,r29
        /* u-boot entry point is u-boot base + 0x100 */
	addi	r9,r9,0x100
        mtlr    r9
        blr

disable_cache:
        li      r2,1024 /* flush 16K cache */
        mtctr   r2
        mr      r3,r2
        lis     r4,0xC000
loop1:
        lwz     r6,0(r4)
        addi    r4,r4,16
        bdnz    loop1

        lis     r4,0xC000
        mtctr   r3
loop2:
        dcbf    r0,r4
        addi    r4,r4,16
        bdnz    loop2

        mfspr   r4,HID0
        li      r3,0
        ori     r3,r3,HID0_ICE|HID0_DCE
        andc    r4,r4,r3
        mtspr   HID0,r4
        isync
        blr
