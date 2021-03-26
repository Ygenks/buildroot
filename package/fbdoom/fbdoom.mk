FBDOOM_VERSION = 476a0cef4a3068015f85993bc916fca38bc2d970
FBDOOM_SITE = $(call github,maximevince,fbDOOM,$(FBDOOM_VERSION))

define FBDOOM_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D)/fbdoom all
endef

define FBDOOM_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/fbdoom/fbdoom $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
