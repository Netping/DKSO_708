include $(TOPDIR)/rules.mk

PKG_NAME:="owrt_web_notifications"
PKG_VERSION=1.2
PKG_REV:=fa5c86d897f697a5754640dcaa8e5cb22f6deab9
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
  SUBMENU:=Utils and boot scripts
  TITLE:=web interface for notifications module
  URL:=https://github.com/Netping/OWRT-WEB-Notifications
  MAINTAINER:=Andrei Zelenin <info@netping.ru>
  DEPENDS:=
endef

define Package/owrt_web_notifications/description
 Web interface for notifications module
endef

MODULE_FILES_DIR:=/usr/lib/lua/luci
CSS_FILES_DIR:=/www/luci-static


define Package/owrt_web_notifications/install
	mkdir -p $(1)$(MODULE_FILES_DIR)
	cp -r $(PKG_BUILD_DIR)/luasrc/* $(1)$(MODULE_FILES_DIR)
	mkdir -p $(1)$(CSS_FILES_DIR)
	cp -r $(PKG_BUILD_DIR)/luci-static/* $(1)$(CSS_FILES_DIR)
endef

$(eval $(call BuildPackage,owrt_web_notifications))
