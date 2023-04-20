include $(TOPDIR)/rules.mk

PKG_NAME:=owrt_web_digital_outs
PKG_VERSION=0.1
PKG_REV:=d019604b98d188f9a93bb90b5f29313bb7c9ffbd
PKG_RELEASE:=28

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Netping/OWRT-WEB-Digital-outs.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt_web_digital_outs
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=web interface for binary outputs control module
  URL:=https://github.com/Netping/OWRT-WEB-Digital-outs
  MAINTAINER:=Aleksey Lozhanin <info@netping.ru>
  DEPENDS:= +owrt-digital-outs +luci-base +luci-compat
endef

define Package/owrt_web_digital_outs/description
 Web interface for binary outputs control module
endef

MODULE_FILES:=luasrc/controller/owrt_web_digital_outs/index.lua
MODULE_FILES_DIR:=/usr/lib/lua/luci/controller/owrt_web_digital_outs/
VIEW_FILES:=luasrc/view/owrt_web_digital_outs/digital_outs.htm
VIEW_FILES_DIR:=/usr/lib/lua/luci/view/owrt_web_digital_outs/
STATIC_FILES:=netping
STATIC_FILES_DIR:=/www/luci-static/netping/
I18N_FILES:=i18n
I18N_FILES_DIR:=/usr/lib/lua/luci/i18n/

define Package/owrt_web_notifications/install
	mkdir -p $(1)$(MODULE_FILES_DIR)
	mkdir -p $(1)$(VIEW_FILES_DIR)
	mkdir -p $(1)$(STATIC_FILES_DIR)
	mkdir -p $(1)$(I18N_FILES_DIR)
	cp -r $(PKG_BUILD_DIR)/$(MODULE_FILES) $(1)$(MODULE_FILES_DIR)
	cp -r $(PKG_BUILD_DIR)/$(VIEW_FILES) $(1)$(VIEW_FILES_DIR)
	cp -r $(PKG_BUILD_DIR)/$(STATIC_FILES)/* $(1)$(STATIC_FILES_DIR)
	cp -r $(PKG_BUILD_DIR)/$(I18N_FILES)/*.lmo $(1)$(I18N_FILES_DIR)
endef

define Package/owrt_web_digital_outs/clean
	rm -r $(1)$(MODULE_FILES_DIR)
	rm -r $(1)$$(1)$(VIEW_FILES_DIR)
	rm -r $(1)$(STATIC_FILES_DIR)$(PKG_NAME).*
	rm -r $(1)$(I18N_FILES_DIR)$(PKG_NAME).*.lmo
endef

$(eval $(call BuildPackage,owrt_web_digital_outs))
