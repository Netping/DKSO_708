include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-web-email-settings"
PKG_VERSION=0.2
PKG_REV:=dc5ea70b7431d8e554acacbc1bfe837193147cbd
PKG_RELEASE:=13

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
  SUBMENU:=Base
  TITLE:=web interface for email module
  URL:=https://github.com/Netping/OWRT-WEB-email-settings
  MAINTAINER:=Alexander Stepanov <info@netping.ru>
  DEPENDS:=
endef

define Package/owrt-web-email-settings/description
 Web interface for email module
endef

MODULE_FILES:=luasrc/controller/owrt_web_email_settings/index.lua
MODULE_FILES_DIR:=/usr/lib/lua/luci/controller/owrt_web_email_settings/
MODEL_FILES:=luasrc/model/cbi/owrt_web_email_settings/email_config.lua
MODEL_FILES_DIR:=/usr/lib/lua/luci/model/cbi/owrt_web_email_settings/


STATIC_FILES:=netping
STATIC_FILES_DIR:=/www/luci-static/netping/
I18N_FILES:=i18n
I18N_FILES_DIR:=/usr/lib/lua/luci/i18n/

define Package/owrt-web-email-settings/install
	$(INSTALL_DIR) $(1)$(MODULE_FILES_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(MODULE_FILES) $(1)$(MODULE_FILES_DIR)	
	
	$(INSTALL_DIR) $(1)$(MODEL_FILES_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(MODEL_FILES) $(1)$(MODEL_FILES_DIR)	
	
	$(INSTALL_DIR) $(1)$(STATIC_FILES_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(STATIC_FILES)/* $(1)$(STATIC_FILES_DIR)	
	
	$(INSTALL_DIR) $(1)$(I18N_FILES_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(I18N_FILES)/*.lmo $(1)$(I18N_FILES_DIR)
	
endef

define Package/owrt-web-email-settings/clean
	rm -r $(1)$(MODULE_FILES_DIR)
	rm -r $(1)$$(1)$(MODEL_FILES_DIR)
	rm -r $(1)$(STATIC_FILES_DIR)$(PKG_NAME)s.*
	rm -r $(1)$(I18N_FILES_DIR)$(PKG_NAME).*.lmo
endef


$(eval $(call BuildPackage,owrt-web-email-settings))
