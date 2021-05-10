include $(TOPDIR)/rules.mk

PKG_NAME:=np-ubus-python
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/np-ubus-python-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/Netping/dksf708-phyton-ubus/files/6453247/
PKG_HASH:=3d67b38567fbba81ce2654c300d0a5aa472d428281fc078466f073e706fb5b1b


PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/np-ubus-python
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Utils and boot scripts
  TITLE:=Python bindings for ubus
  URL:=https://github.com/Netping/dksf708-phyton-ubus
  MAINTAINER:=Mikhail Sadikov <info@netping.ru>
  DEPENDS:=+libblobmsg-json +libubox +libubus
endef

define Package/np-ubus-python/description
 np-ubus-python - python bindings for ubus
endef

define Package/np-ubus-python/install
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/lib-dynload
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ubus.cpython-37.so $(1)/usr/lib/python3.7/lib-dynload
endef

$(eval $(call BuildPackage,np-ubus-python,+libblobmsg-json,+libubox,+libubus))
