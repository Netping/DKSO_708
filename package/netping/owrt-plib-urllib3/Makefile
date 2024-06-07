include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-plib-urllib3"
PKG_VERSION:=2.2.0
PKG_REV:=595d85e74581344f00ba0181b65a86f86c70c5fc
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-plib-urllib3-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-PLIB-urllib3.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1


include $(INCLUDE_DIR)/package.mk

define Package/owrt-plib-urllib3
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=HTTP library with thread-safe connection pooling, file post, and more.
  URL:=https://github.com/Netping/OWRT-PLIB-urllib3
  MAINTAINER:=NetPing East <info@netping.ru>
endef

define Package/owrt-plib-urllib3/description
 HTTP library with thread-safe connection pooling, file post, and more.
endef


SITE_PACKAGE_DIR:=/usr/lib/python3.7/site-packages/
MODULE_SRC_DIR:=urllib3
MODULE_DIST_DIR:=urllib3-2.2.0.dist-info



ETC_FILES=
ETC_FILES_DIR=/etc/netping/$(PKG_NAME)

define Package/owrt-plib-urllib3/install
	$(INSTALL_DIR) $(1)$(SITE_PACKAGE_DIR)$(MODULE_SRC_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(MODULE_SRC_DIR)/* $(1)$(SITE_PACKAGE_DIR)$(MODULE_SRC_DIR)
	
	$(INSTALL_DIR) $(1)$(SITE_PACKAGE_DIR)$(MODULE_DIST_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(MODULE_DIST_DIR)/* $(1)$(SITE_PACKAGE_DIR)$(MODULE_DIST_DIR)
endef

define Package/owrt-plib-urllib3/remove
	rm -rf $(SITE_PACKAGE_DIR)$(MODULE_FILES_DIR_SRC)
	rm -rf $(SITE_PACKAGE_DIR)$(MODULE_FILES_DIR_DIST)
endef
$(eval $(call BuildPackage,owrt-plib-urllib3))
