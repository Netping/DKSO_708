include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-web-modem-settings"
PKG_VERSION=0.1
PKG_REV:=f1d5dceee558f1b6e2a9f4b11cd8a9d97e63d7db
PKG_RELEASE:=4

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-web-modem-settings-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-WEB-modem-settings.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-web-modem-settings
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=web interface for modem module
  URL:=https://github.com/Netping/OWRT-WEB-modem-settings
  MAINTAINER:=Nina Hoang <info@netping.ru>
  DEPENDS:=owrt-sms-protocol luci-base luci-compat
endef

define Package/owrt-web-modem-settings/description
 Web interface for modem module
endef

MODULE_NAME = owrt_web_modem_settings
MODULE_FILES = luasrc/*
MODULE_FILES_DIR = /usr/lib/lua/luci/
STATIC_FILES = netping/*
STATIC_FILES_DIR = /www/luci-static/netping/
I18N_FILES = i18n/*.lmo
I18N_FILES_DIR = /usr/lib/lua/luci/i18n/

define Package/owrt-web-modem-settings/install


	$(INSTALL_DIR) $(1)$(MODULE_FILES_DIR)
	$(CP) -r $(PKG_BUILD_DIR)/$(MODULE_FILES) $(1)$(MODULE_FILES_DIR)	
	
	$(INSTALL_DIR) $(1)$(STATIC_FILES_DIR)
	$(CP) -r $(PKG_BUILD_DIR)/$(STATIC_FILES) $(1)$(STATIC_FILES_DIR)	
	
	$(INSTALL_DIR) $(1)$(I18N_FILES_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(I18N_FILES) $(1)$(I18N_FILES_DIR)
	
endef

define Package/owrt-web-modem-settings/clean
	rm -r $(1)$(MODULE_FILES_DIR)
	rm -r $(1)$(STATIC_FILES_DIR)$(PKG_NAME)s.*
	rm -r $(1)$(I18N_FILES_DIR)$(PKG_NAME).*.lmo
endef


$(eval $(call BuildPackage,owrt-web-modem-settings))
