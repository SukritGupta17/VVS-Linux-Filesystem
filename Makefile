ifneq ($(KERNELRELEASE),)
# kbuild part of makefile, for backwards compatibility
include Kbuild

else
# normal makefile
KDIR ?= /lib/modules/`uname -r`/build

default:
	$(MAKE) -C $(KDIR) M=$$PWD

endif
