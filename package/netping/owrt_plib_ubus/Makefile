include $(TOPDIR)/rules.mk

PKG_NAME:=owrt-plib-ubus
PKG_VERSION:=0.1.1
PKG_RELEASE:=2

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-plib-ubus-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/Netping/OWRT-PLIB-UBUS/files/7590748/
PKG_HASH:=3deeb41b64bf4c4a8bcfee2584c9152e3a440b750b9ed0b29702759b69cccc27


PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-plib-ubus
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Utils and boot scripts
  TITLE:=Python bindings for ubus
  URL:=https://github.com/Netping/OWRT-PLIB-UBUS
  MAINTAINER:=Mikhail Sadikov <info@netping.ru>
  DEPENDS:=+libblobmsg-json +libubox +libubus
endef

define Package/owrt-plib-ubus/description
 owrt-plib-ubus - python bindings for ubus
endef

define Package/owrt-plib-ubus/install
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/lib-dynload
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ubus.cpython-37-arm_cortex-a7+neon-vfpv4.so $(1)/usr/lib/python3.7/lib-dynload/ubus.cpython-37.so
endef

$(eval $(call BuildPackage,owrt-plib-ubus,+libblobmsg-json,+libubox,+libubus))
