include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-web-dlines-config"
PKG_VERSION=0.1
PKG_REV:=20c8d563e96a8cb0a72eb622679f040dd89b694f
PKG_RELEASE:=7

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-web-dlines-config-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-WEB-dlines-config.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-web-dlines-config
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=WEB-APP
  TITLE:=web interface for configuration IO lines
  URL:=https://github.com/Netping/OWRT-WEB-dlines-config
  MAINTAINER:=Alexey Lozhanin <info@netping.ru>
  DEPENDS:= +owrt-gpio-protocol +luci-base +luci-compat
endef

define Package/owrt-web-dlines-config/description
 Web interface for configuration IO lines
endef


MODULE_FILES:=luasrc/controller/owrt_web_dlines_config/index.lua
MODULE_FILES_DIR:=/usr/lib/lua/luci/controller/owrt_web_dlines_config/
VIEW_FILES:=luasrc/view/owrt_web_dlines_config/dlines_config.htm
VIEW_FILES_DIR:=/usr/lib/lua/luci/view/owrt_web_dlines_config/
STATIC_FILES:=netping
STATIC_FILES_DIR:=/www/luci-static/netping/
I18N_FILES:=i18n
I18N_FILES_DIR:=/usr/lib/lua/luci/i18n/

define Package/owrt-web-dlines-config/install
	$(INSTALL_DIR) $(1)$(MODULE_FILES_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(MODULE_FILES) $(1)$(MODULE_FILES_DIR)	
	
	$(INSTALL_DIR) $(1)$(VIEW_FILES_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(VIEW_FILES) $(1)$(VIEW_FILES_DIR)	
	
	$(INSTALL_DIR) $(1)$(STATIC_FILES_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(STATIC_FILES)/* $(1)$(STATIC_FILES_DIR)	
	
	
	$(INSTALL_DIR) $(1)$(I18N_FILES_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(I18N_FILES)/*.lmo $(1)$(I18N_FILES_DIR)
endef

define Package/owrt-web-dlines-config/clean
	rm -r $(1)$(MODULE_FILES_DIR)
	rm -r $(1)$$(1)$(VIEW_FILES_DIR)
	rm -r $(1)$(STATIC_FILES_DIR)$(PKG_NAME)s.*
	rm -r $(1)$(I18N_FILES_DIR)$(PKG_NAME).*.lmo
endef

$(eval $(call BuildPackage,owrt-web-dlines-config))
