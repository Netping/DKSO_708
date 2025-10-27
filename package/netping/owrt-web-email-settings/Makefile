include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-web-email-settings"
PKG_VERSION=0.2
PKG_REV:=89450c38af599c1fb121ab1f863a7f400816e27a
PKG_RELEASE:=31

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-web-email-settings-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-WEB-email-settings.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-web-email-settings
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=WEB-APP
  TITLE:=web interface for email module
  URL:=https://github.com/Netping/OWRT-WEB-email-settings
  MAINTAINER:=Alexander Stepanov <info@netping.ru>
  DEPENDS:=+owrt-email +owrt-input-validate +luci-base +luci-compat
endef

define Package/owrt-web-email-settings/description
 Web interface for email module
endef

MODULE_NAME:=owrt_web_email_settings
MODULE_FILES:=luasrc/*
MODULE_FILES_DIR:=/usr/lib/lua/luci/
STATIC_FILES:=netping/*
STATIC_FILES_DIR:=/www/luci-static/netping/
I18N_FILES:=i18n/*.lmo
I18N_FILES_DIR:=/usr/lib/lua/luci/i18n/
STATIC_CONFIG:=usr/share/rpcd/acl.d/*
MODULE_CONFIG_DIR:=/usr/share/rpcd/acl.d/

define Package/owrt-web-email-settings/install
	$(INSTALL_DIR) $(1)$(MODULE_FILES_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(MODULE_FILES) $(1)$(MODULE_FILES_DIR)	
	
	$(INSTALL_DIR) $(1)$(STATIC_FILES_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(STATIC_FILES) $(1)$(STATIC_FILES_DIR)	
	
	$(INSTALL_DIR) $(1)$(STATIC_CONFIG_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(STATIC_CONFIG) $(1)$(STATIC_CONFIG_DIR)	
	
	$(INSTALL_DIR) $(1)$(I18N_FILES_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(I18N_FILES) $(1)$(I18N_FILES_DIR)
	
endef

define Package/owrt-web-email-settings/clean
	rm -r $(1)$(MODULE_FILES_DIR)controller/$(MODULE_NAME)
	rm -r $(1)$(MODULE_FILES_DIR)model/cbi/$(MODULE_NAME)
	rm -r $(1)$(MODULE_FILES_DIR)view/$(MODULE_NAME)
	rm -r $(1)$(STATIC_FILES_DIR)$(MODULE_NAME).*
	rm -r $(1)$(I18N_FILES_DIR)$(MODULE_NAME).*.lmo
endef


$(eval $(call BuildPackage,owrt-web-email-settings))
