include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-plib-requests"
PKG_VERSION:=2.31.0
PKG_REV:=a1a7002e39dd3c4e5508f52b3fe38d9196390995
PKG_RELEASE:=5

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-plib-requests-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-PLIB-requests.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-plib-requests
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=PLIB
  TITLE:=Python requests 2.31.0 library
  URL:=https://github.com/Netping/OWRT-PLIB-requests
  MAINTAINER:=NetPing East <info@netping.ru>
  DEPENDS:=+owrt-plib-chardet +owrt-plib-certifi +owrt-plib-idna +owrt-plib-urllib3
endef

define Package/owrt-plib-requests/description
 Python requests 2.31.0 library
endef

SITE_PACKAGE_DIR:=/usr/lib/python3.7/site-packages/
MODULE_SRC_DIR:=requests
MODULE_DIST_DIR:=requests-2.31.0.dist-info


define Package/owrt-plib-requests/install
	$(INSTALL_DIR) $(1)$(SITE_PACKAGE_DIR)$(MODULE_SRC_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(MODULE_SRC_DIR)/* $(1)$(SITE_PACKAGE_DIR)$(MODULE_SRC_DIR)
	
	$(INSTALL_DIR) $(1)$(SITE_PACKAGE_DIR)$(MODULE_DIST_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(MODULE_DIST_DIR)/* $(1)$(SITE_PACKAGE_DIR)$(MODULE_DIST_DIR)
	
endef

define Package/owrt-plib-requests/remove
	rm -rf $(SITE_PACKAGE_DIR)$(MODULE_FILES_DIR_SRC)
	rm -rf $(SITE_PACKAGE_DIR)$(MODULE_FILES_DIR_DIST)
endef

$(eval $(call BuildPackage,owrt-plib-requests))
