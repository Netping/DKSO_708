include $(TOPDIR)/rules.mk

PKG_NAME:=np-python-webserver
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/np-python-webserver-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/Netping/TEST_PHYTHONWEB/files/6868141/
PKG_HASH:=ec81584492c8f89c60a62c067025249f775c76c9ab9bf2807caa1003c6baf412


PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/np-python-webserver
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Utils and boot scripts
  TITLE:=simple webserver
  URL:=https://github.com/Netping/TEST_PHYTHONWEB
  MAINTAINER:=Alexander Shenshin <info@netping.ru>
endef

define Package/np-python-webserver/description
 simple webserver
endef

define Package/np-python-webserver/install
	$(INSTALL_DIR) $(1)/root/webserver/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/root/webserver/server.py $(1)/root/webserver/
	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/init.d/webserver $(1)/etc/init.d/
	$(INSTALL_DIR) $(1)/etc/config/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/config/webserver $(1)/etc/config/
endef

$(eval $(call BuildPackage,np-python-webserver))
