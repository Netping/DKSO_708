include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-web-notifications"
PKG_VERSION=0.2
PKG_REV:=7a8d1cb6b7a9a27ddf6dbca5d01f62531da43de1
PKG_RELEASE:=16

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-web-notifications-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-WEB-Notifications.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-web-notifications
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=WEB-APP
  TITLE:=web interface for notifications module
  URL:=https://github.com/Netping/OWRT-WEB-Notifications
  MAINTAINER:=Alexey Lozhanin <info@netping.ru>
  DEPENDS:= +owrt-notifications +luci-base +luci-compat
endef

define Package/owrt-web-notifications/description
 Web interface for notifications module
endef

MODULE_FILES:=luasrc/controller/owrt_web_notification/index.lua
MODULE_FILES_DIR:=/usr/lib/lua/luci/controller/owrt_web_notification/
VIEW_FILES:=luasrc/view/owrt_web_notification/notification.htm
VIEW_FILES_DIR:=/usr/lib/lua/luci/view/owrt_web_notification/
STATIC_FILES:=netping
STATIC_FILES_DIR:=/www/luci-static/netping/
I18N_FILES:=i18n
I18N_FILES_DIR:=/usr/lib/lua/luci/i18n/

define Package/owrt-web-notifications/install
	$(INSTALL_DIR) $(1)$(MODULE_FILES_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(MODULE_FILES) $(1)$(MODULE_FILES_DIR)	
	
	$(INSTALL_DIR) $(1)$(VIEW_FILES_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(VIEW_FILES) $(1)$(VIEW_FILES_DIR)	
	
	$(INSTALL_DIR) $(1)$(STATIC_FILES_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(STATIC_FILES)/* $(1)$(STATIC_FILES_DIR)	
	
	
	$(INSTALL_DIR) $(1)$(I18N_FILES_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(I18N_FILES)/*.lmo $(1)$(I18N_FILES_DIR)
endef

define Package/owrt-web-notifications/clean
	rm -r $(1)$(MODULE_FILES_DIR)
	rm -r $(1)$$(1)$(VIEW_FILES_DIR)
	rm -r $(1)$(STATIC_FILES_DIR)$(PKG_NAME)s.*
	rm -r $(1)$(I18N_FILES_DIR)$(PKG_NAME).*.lmo
endef

$(eval $(call BuildPackage,owrt-web-notifications))
