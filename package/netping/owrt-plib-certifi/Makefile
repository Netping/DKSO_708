include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-plib-certifi"
PKG_VERSION:=2024.2.2
PKG_REV:=1be1e65a0e86d92d553979fb1c9da1bb364d6663
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-plib-certifi-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-PLIB-certifi.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1


include $(INCLUDE_DIR)/package.mk

define Package/owrt-plib-certifi
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=Mozilla’s collection of Root Certificates
  URL:=https://github.com/Netping/OWRT-PLIB-certifi
  MAINTAINER:=NetPing East <info@netping.ru>
endef

define Package/owrt-plib-certifi/description
 Mozilla’s collection of Root Certificates
endef


SITE_PACKAGE_DIR:=/usr/lib/python3.7/site-packages/
MODULE_SRC_DIR:=certifi
MODULE_DIST_DIR:=certifi-2024.2.2.dist-info

ETC_FILES=
ETC_FILES_DIR=/etc/netping/$(PKG_NAME)

define Package/owrt-plib-certifi/install
	$(INSTALL_DIR) $(1)$(SITE_PACKAGE_DIR)$(MODULE_SRC_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(MODULE_SRC_DIR)/* $(1)$(SITE_PACKAGE_DIR)$(MODULE_SRC_DIR)
	
	$(INSTALL_DIR) $(1)$(SITE_PACKAGE_DIR)$(MODULE_DIST_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(MODULE_DIST_DIR)/* $(1)$(SITE_PACKAGE_DIR)$(MODULE_DIST_DIR)
endef

define Package/owrt-plib-certifi/remove
	rm -rf $(SITE_PACKAGE_DIR)$(MODULE_FILES_DIR_SRC)
	rm -rf $(SITE_PACKAGE_DIR)$(MODULE_FILES_DIR_DIST)
endef
$(eval $(call BuildPackage,owrt-plib-certifi))
