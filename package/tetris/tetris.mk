TETRIS_VERSION = 8d0cec865db2277d15a79138b2b0fd7c8c2ed1cb
TETRIS_SITE = $(call github,mzorro,framebuffer-tetris,$(TETRIS_VERSION))

define TETRIS_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D) build
	mv $(@D)/main $(@D)/tetris
endef

define TETRIS_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/tetris $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
