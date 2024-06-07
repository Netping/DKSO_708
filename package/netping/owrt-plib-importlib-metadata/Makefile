include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-plib-importlib-metadata"
PKG_VERSION:=4.11.1
PKG_REV:=2dceff16f3fd23c0395cc16c3793e70972ce01bd
PKG_RELEASE:=2

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-plib-importlib-metadata-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-PLIB-importlib-metadata.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-plib-importlib-metadata
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=Python importlib-metadata 4.11.1-1 library
  URL:=https://github.com/Netping/OWRT-PLIB-importlib-metadata
  MAINTAINER:=Leonid Khlebushchev <info@netping.ru>
endef

SITE_PACKAGE_DIR:=/usr/lib/python3.7/site-packages/
MODULE_SRC_DIR:=importlib_metadata
MODULE_DIST_DIR:=importlib_metadata-4.11.1.dist-info

define Package/owrt-plib-importlib-metadata/description
 Python importlib-metadata 4.11.1-1 library
endef

define Package/owrt-plib-importlib-metadata/install
	$(INSTALL_DIR) $(1)$(SITE_PACKAGE_DIR)$(MODULE_SRC_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(MODULE_SRC_DIR)/* $(1)$(SITE_PACKAGE_DIR)$(MODULE_SRC_DIR)
	
	$(INSTALL_DIR) $(1)$(SITE_PACKAGE_DIR)$(MODULE_DIST_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(MODULE_DIST_DIR)/* $(1)$(SITE_PACKAGE_DIR)$(MODULE_DIST_DIR)
endef

define Package/owrt-plib-importlib-metadata/remove
	rm -rf $(SITE_PACKAGE_DIR)$(MODULE_FILES_DIR_SRC)
	rm -rf $(SITE_PACKAGE_DIR)$(MODULE_FILES_DIR_DIST)
endef

$(eval $(call BuildPackage,owrt-plib-importlib-metadata))
