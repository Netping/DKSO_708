include $(TOPDIR)/rules.mk

PKG_NAME:=owrt-plib-ubus
PKG_VERSION:=0.1.1
PKG_REV:=30d7c0f85e4d706be0e09d48354cd90a69277b8f
PKG_RELEASE:=7

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-plib-ubus-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-PLIB-UBUS.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-plib-ubus
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=PLIB
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
