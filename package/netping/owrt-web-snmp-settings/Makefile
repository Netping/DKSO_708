include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-web-snmp-settings"
PKG_VERSION:=0.1
PKG_REV:=fa40463b75d8d1cc64a0b6dd3c4b2d35701937e8
PKG_RELEASE:=8

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-web-snmp-settings-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-WEB-SNMP-settings.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-web-snmp-settings
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=WEB-APP
  TITLE:=web interface for snmpd module
  URL:=https://github.com/Netping/OWRT-WEB-SNMP-settings
  MAINTAINER:="Dmitry Ivankov"
  DEPENDS:=+luci-base +luci-compat +snmpd
endef

define Package/owrt-web-snmp-settings/description
 Web interface for snmpd module
endef

MODULE_NAME:=owrt_web_snmp_settings
MODULE_FILES:=luasrc/*
MODULE_FILES_DIR:=/usr/lib/lua/luci/

STATIC_FILES:=netping/*
STATIC_FILES_DIR:=/www/luci-static/netping/

I18N_FILES:=i18n/*.lmo
I18N_FILES_DIR:=/usr/lib/lua/luci/i18n/

define Package/owrt-web-snmp-settings/install
	$(INSTALL_DIR) $(1)$(MODULE_FILES_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(MODULE_FILES) $(1)$(MODULE_FILES_DIR)	
	
	$(INSTALL_DIR) $(1)$(STATIC_FILES_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(STATIC_FILES) $(1)$(STATIC_FILES_DIR)	
	
	$(INSTALL_DIR) $(1)$(I18N_FILES_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(I18N_FILES) $(1)$(I18N_FILES_DIR)
	
endef

define Package/owrt-web-snmp-settings/clean
	rm -r $(1)$(MODULE_FILES_DIR)controller/$(MODULE_NAME)
	rm -r $(1)$(MODULE_FILES_DIR)model/cbi/$(MODULE_NAME)
	rm -r $(1)$(STATIC_FILES_DIR)$(MODULE_NAME).*
	rm -r $(1)$(I18N_FILES_DIR)$(MODULE_NAME).*.lmo
endef


$(eval $(call BuildPackage,owrt-web-snmp-settings))
