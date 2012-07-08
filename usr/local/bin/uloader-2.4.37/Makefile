# Makefile for uloader.o
#
# Copyright (C) 2006 Mihai Georgian <u-boot@linuxnotincluded.org.uk>
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation; either version 2 of
# the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston,
# MA 02111-1307 USA
#
# Based on:
#   Makefile for loader.o by Chih-Chung Chang <jochang@gmail.com>
#   CFLAGS taken from linux-2.4.17_mvl21-sandpoint
#
# To compile this module you will need a fully configured kernel
# 2.4.17_mvl21-sandpoint and gcc 2.95

# Change INCLUDE to match your environment
#INCLUDE = -nostdinc -I/opt/embedded/ppc/list/linux-2.4.17_mvl21-sandpoint.ref/include -I/opt/embedded/ppc/list/linux-2.4.17_mvl21-sandpoint.ref/arch/ppc -I/opt/embedded/ppc/toolchain/usr/lib/gcc-lib/powerpc-linux/2.95.3/include

INCLUDE = -nostdinc   -I/usr/src/linux-2.4.37/include/   -I/usr/src/linux-2.4.37/arch/ppc   -I//usr/lib/gcc-lib/powerpc-linux-gnu/3.3.6/include 

CFLAGS = -D__KERNEL__ -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -fsigned-char -msoft-float -pipe -ffixed-r2 -Wno-uninitialized -mmultiple -mstring -DMODULE

CC = $(CROSS_COMPILE)gcc
LD = $(CROSS_COMPILE)ld

uloader.o: uloader_mod.o uloader_boot.o
	$(LD) -r uloader_mod.o uloader_boot.o -o uloader.o
uloader_mod.o: uloader_mod.c
	$(CC) -c $(INCLUDE) $(CFLAGS) uloader_mod.c
uloader_boot.o: uloader_boot.S
	$(CC) -c -mregnames uloader_boot.S
clean:
	rm -f uloader.o uloader_mod.o uloader_boot.o
