include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-web-sensor-value"
PKG_VERSION=0.2
PKG_REV:=821b84452e99b6ee9eaaa0b27cd0249024a45c0d
PKG_RELEASE:=14

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-web-sensor-value-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-WEB-sensor-value.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-web-sensor-value
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=WEB-APP
  TITLE:=web interface for owrt-sensor-value module
  URL:=https://github.com/Netping/OWRT-WEB-sensor-value
  MAINTAINER:=Alexander N <info@netping.ru>
  DEPENDS:= +owrt-sensor-value +luci-base
endef

define Package/owrt-web-sensor-value/description
 Web interface for owrt-sensor-value module
endef

MODULE_NAME:=owrt-web-sensor-value
MODULE_FILES_DIR:=/usr/lib/lua/luci/
ACL_FILES_DIR:=/usr/share/rpcd/acl.d/
STATIC_FILES_DIR:=/www/luci-static/resources/view/

define Package/owrt-web-sensor-value/install
	mkdir -p $(1)$(MODULE_FILES_DIR)
	mkdir -p $(1)$(ACL_FILES_DIR)
	mkdir -p $(1)$(STATIC_FILES_DIR)
	cp -r $(PKG_BUILD_DIR)/luasrc/* $(1)$(MODULE_FILES_DIR)
	cp -r $(PKG_BUILD_DIR)/root/usr/share/rpcd/acl.d/* $(1)$(ACL_FILES_DIR)
	cp -r $(PKG_BUILD_DIR)/htdocs/luci-static/resources/view/* $(1)$(STATIC_FILES_DIR)
endef

define Package/owrt-web-sensor-value/clean
	rm $(1)$(MODULE_FILES_DIR)controller/$(MODULE_NAME).lua
	rm $(1)$(MODULE_FILES_DIR)i18n/$(MODULE_NAME).*.lmo
	rm $(1)$(ACL_FILES_DIR)$(MODULE_NAME).json
	rm -r $(1)$(STATIC_FILES_DIR)$(MODULE_NAME)
endef

$(eval $(call BuildPackage,owrt-web-sensor-value))
