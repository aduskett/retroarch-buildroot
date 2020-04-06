################################################################################
#
# retroarch-assets
#
################################################################################

RETROARCH_ASSETS_VERSION = 190c85b32b3530ccd207f707d2b3ba4a219aeb16
RETROARCH_ASSETS_SITE = https://github.com/libretro/retroarch-assets.git
RETROARCH_ASSETS_SITE_METHOD = git
RETROARCH_ASSETS_LICENSE = CC-BY-4.0
RETROARCH_ASSETS_LICENSE_FILES = COPYING
RETROARCH_ASSETS_DEPENDENCIES = host-pkgconf

RETROARCH_ASSETS_INSTALL_DIR=$/usr/share/libretro/assets/

define RETROARCH_ASSETS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/$(RETROARCH_ASSETS_DESTDIR)
	DESTDIR=$(TARGET_DIR) INSALLDIR=$(RETROARCH_ASSETS_INSTALL_DIR) \
		$(MAKE) -C $(@D) install
endef

$(eval $(generic-package))
