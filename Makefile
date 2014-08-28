
all: kernel_mod mkfs.vvsfs truncate

mkfs.vvsfs: mkfs.vvsfs.c
	gcc -Wall -o $@ $<

truncate: truncate.c
	gcc -Wall -o $@ $<

ifneq ($(KERNELRELEASE),)
# kbuild part of makefile, for backwards compatibility
include Kbuild

else
# normal makefile
KDIR ?= /lib/modules/`uname -r`/build

kernel_mod:
	$(MAKE) -C $(KDIR) M=$$PWD

endif
