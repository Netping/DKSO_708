include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-plib-idna"
PKG_VERSION:=3.3
PKG_REV:=737b0638d96b20fcc5c8186b71d44d649d77570d
PKG_RELEASE:=5

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-plib-idna-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-PLIB-idna.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1


include $(INCLUDE_DIR)/package.mk

define Package/owrt-plib-idna
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=PLIB
  TITLE:=Internationalized Domain Names in Applications (IDNA) lib
  URL:=https://github.com/Netping/OWRT-PLIB-idna
  MAINTAINER:=NetPing East <info@netping.ru>
endef

define Package/owrt-plib-idna/description
 Internationalized Domain Names in Applications (IDNA) lib
endef

SITE_PACKAGE_DIR:=/usr/lib/python3.7/site-packages/
MODULE_SRC_DIR:=idna
MODULE_DIST_DIR:=idna-3.3.dist-info


define Package/owrt-plib-idna/install
	$(INSTALL_DIR) $(1)$(SITE_PACKAGE_DIR)$(MODULE_SRC_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(MODULE_SRC_DIR)/* $(1)$(SITE_PACKAGE_DIR)$(MODULE_SRC_DIR)
	
	$(INSTALL_DIR) $(1)$(SITE_PACKAGE_DIR)$(MODULE_DIST_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(MODULE_DIST_DIR)/* $(1)$(SITE_PACKAGE_DIR)$(MODULE_DIST_DIR)
endef

define Package/owrt-plib-idna/remove
	rm -rf $(SITE_PACKAGE_DIR)$(MODULE_FILES_DIR_SRC)
	rm -rf $(SITE_PACKAGE_DIR)$(MODULE_FILES_DIR_DIST)
endef
$(eval $(call BuildPackage,owrt-plib-idna))
