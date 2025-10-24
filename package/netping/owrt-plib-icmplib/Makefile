include $(TOPDIR)/rules.mk

PKG_NAME:=owrt-plib-icmplib
PKG_VERSION:=3.0.2-1
PKG_REV:=727296fc1b65abd58f3e77cf466b87481db95486
PKG_RELEASE:=3

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-plib-icmplib-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-PLIB-icmplib.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-plib-icmplib
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=PLIB
  TITLE:=ICMPlib and dependencies
  URL:=https://github.com/Netping/OWRT-PLIB-icmplib
  MAINTAINER:=Leonid Khlebushchev <info@netping.ru>
endef

define Package/owrt-plib-icmplib/description
 ICMPlib and dependencies
endef

SITE_PACKAGE_DIR:=/usr/lib/python3.7/site-packages/
MODULE_SRC_DIR:=icmplib
MODULE_DIST_DIR:=icmplib-3.0.2.dist-info

define Package/owrt-plib-icmplib/install
	$(INSTALL_DIR) $(1)$(SITE_PACKAGE_DIR)$(MODULE_SRC_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(MODULE_SRC_DIR)/* $(1)$(SITE_PACKAGE_DIR)$(MODULE_SRC_DIR)
	
	$(INSTALL_DIR) $(1)$(SITE_PACKAGE_DIR)$(MODULE_DIST_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(MODULE_DIST_DIR)/* $(1)$(SITE_PACKAGE_DIR)$(MODULE_DIST_DIR)
endef

define Package/owrt-plib-icmplib/clean
	rm -rf $(SITE_PACKAGE_DIR)$(MODULE_FILES_DIR_SRC)
	rm -rf $(SITE_PACKAGE_DIR)$(MODULE_FILES_DIR_DIST)
endef

$(eval $(call BuildPackage,owrt-plib-icmplib))
