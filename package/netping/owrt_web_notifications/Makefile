include $(TOPDIR)/rules.mk

PKG_NAME:="owrt_web_notifications"
PKG_VERSION=1.2
PKG_REV:=22fb1b18675e920658a6cf7196fc7f4edb187d71
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt_web_notifications-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Netping/OWRT-WEB-Notifications.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt_web_notifications
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=web interface for notifications module
  URL:=https://github.com/Netping/OWRT-WEB-Notifications
  MAINTAINER:=Andrei Zelenin <info@netping.ru>
  DEPENDS:=
endef

define Package/owrt_web_notifications/description
 Web interface for notifications module
endef

MODULE_FILES_DIR:=/usr/lib/lua/luci
STATIC_FILES:=htdocs/luci-static/resources/*
STATIC_FILES_DIR:=/www/luci-static/resources/


define Package/owrt_web_notifications/install
	mkdir -p $(1)$(MODULE_FILES_DIR)$(STATIC_FILES_DIR)
	cp -r $(PKG_BUILD_DIR)/luasrc/* $(1)$(MODULE_FILES_DIR)
	cp -r $(PKG_BUILD_DIR)/$(STATIC_FILES) $(1)$(MODULE_FILES_DIR)$(STATIC_FILES_DIR)
endef

$(eval $(call BuildPackage,owrt_web_notifications))
