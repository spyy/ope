# If KERNELRELEASE is defined, we've been invoked from the
# kernel build system and can use its language.
ifneq ($(KERNELRELEASE),)
	obj-m := lcdsim.o 
	ccflags-y := -std=gnu99 -Wno-declaration-after-statement
# Otherwise we were called directly from the command
# line; invoke the kernel build system.
else

	KERNELDIR ?= /lib/modules/$(shell uname -r)/build
	PWD  := $(shell pwd)
	CFLAGS += -std=gnu99

default:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

all: reader writer

endif