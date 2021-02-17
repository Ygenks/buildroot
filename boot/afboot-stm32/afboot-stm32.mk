################################################################################
#
# afboot-stm32
#
################################################################################

AFBOOT_STM32_VERSION = 58b30e76491361f2df92f0ce211d89e9e0023e4d
AFBOOT_STM32_SITE = $(call github,bherrera,afboot-stm32,$(AFBOOT_STM32_VERSION))
AFBOOT_STM32_INSTALL_IMAGES = YES
AFBOOT_STM32_INSTALL_TARGET = NO

define AFBOOT_STM32_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CROSS_COMPILE=$(TARGET_CROSS) all
endef

define AFBOOT_STM32_INSTALL_IMAGES_CMDS
	$(INSTALL) -m 0755 -t $(BINARIES_DIR) -D $(@D)/stm32*.bin
endef

$(eval $(generic-package))
