include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-plib-click"
PKG_VERSION:=8.0.3
PKG_REV:=d5a480388c9a3861e9c7d40124e66b301d437d66
PKG_RELEASE:=3

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-plib-click-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-PLIB-click.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz


PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-plib-click
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=PLIB
  TITLE:=Composable command line interface toolkit
  URL:=https://github.com/Netping/OWRT-PLIB-click
  MAINTAINER:=Michael Sadikov <info@netping.ru>
endef

define Package/owrt-plib-click/description
 Composable command line interface toolkit
endef

SITE_PACKAGE_DIR:=/usr/lib/python3.7/site-packages/
MODULE_SRC_DIR:=click
MODULE_DIST_DIR:=click-8.0.3.dist-info



define Package/owrt-plib-click/install
	$(INSTALL_DIR) $(1)$(SITE_PACKAGE_DIR)$(MODULE_SRC_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(MODULE_SRC_DIR)/* $(1)$(SITE_PACKAGE_DIR)$(MODULE_SRC_DIR)
	
	$(INSTALL_DIR) $(1)$(SITE_PACKAGE_DIR)$(MODULE_DIST_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(MODULE_DIST_DIR)/* $(1)$(SITE_PACKAGE_DIR)$(MODULE_DIST_DIR)
endef


define Package/owrt-plib-click/remove
	rm -rf $(SITE_PACKAGE_DIR)$(MODULE_FILES_DIR_SRC)
	rm -rf $(SITE_PACKAGE_DIR)$(MODULE_FILES_DIR_DIST)
endef
$(eval $(call BuildPackage,owrt-plib-click))
