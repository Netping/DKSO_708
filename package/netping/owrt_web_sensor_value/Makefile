include $(TOPDIR)/rules.mk

PKG_NAME:="owrt_web_sensor_value"
PKG_VERSION=0.1
PKG_REV:=c63ba7fad8a09cb5a9dc4ca2b1439c799284a0db
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt_web_sensor_value-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Netping/OWRT-WEB-sensor-value.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt_web_sensor_value
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Utils and boot scripts
  TITLE:=web interface for owrt_sensor_value module
  URL:=https://github.com/Netping/OWRT-WEB-sensor-value
  MAINTAINER:=Alexander N <info@netping.ru>
  DEPENDS:=
endef

define Package/owrt_web_sensor_value/description
 Web interface for owrt_sensor_value module
endef

MODULE_FILES_DIR:=/usr/lib/lua/luci/
ACL_FILES_DIR:=/usr/share/rpcd/acl.d/
STATIC_FILES_DIR:=/www/luci-static/resources/view/

define Package/owrt_web_sensor_value/install
	mkdir -p $(1)$(MODULE_FILES_DIR)
	mkdir -p $(1)$(ACL_FILES_DIR)
	mkdir -p $(1)$(STATIC_FILES_DIR)
	cp -r $(PKG_BUILD_DIR)/luasrc/* $(1)$(MODULE_FILES_DIR)
	cp -r $(PKG_BUILD_DIR)/root/usr/share/rpcd/acl.d/* $(1)$(ACL_FILES_DIR)
	cp -r $(PKG_BUILD_DIR)/htdocs/luci-static/resources/view/* $(1)$(STATIC_FILES_DIR)
endef

define Package/owrt_web_sensor_value/clean
	rm $(1)$(MODULE_FILES_DIR)controller/$(MODULE_NAME).lua
	rm $(1)$(MODULE_FILES_DIR)i18n/$(MODULE_NAME).*.lmo
	rm $(1)$(ACL_FILES_DIR)$(MODULE_NAME).json
	rm -r $(1)$(STATIC_FILES_DIR)$(MODULE_NAME)
endef

$(eval $(call BuildPackage,owrt_web_sensor_value))
