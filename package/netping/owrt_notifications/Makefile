include $(TOPDIR)/rules.mk

PKG_NAME:="owrt_notifications"
PKG_VERSION=1.2
PKG_REV:=2da9f7e54fc85051c58226a3ce62fe5f9a24e698
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt_notifications-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Netping/OWRT_Notifications.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt_notifications
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=notifications module
  URL:=https://github.com/Netping/OWRT_Notifications
  MAINTAINER:=Leonid Khlebushchev <info@netping.ru>
  DEPENDS:= +owrt-plib-ubus
endef

define Package/owrt_notifications/description
 Module for sending notifications
endef

MODULE_FILES:=notify.py
MODULE_FILES_DIR:=/etc/netping_notifications/

CONF_FILE:=notifyconf
CONF_DIR:=/etc/config/

define Package/owrt_notifications/install
	mkdir -p $(1)$(MODULE_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(MODULE_FILES) $(1)$(MODULE_FILES_DIR)
	mkdir -p $(1)$(CONF_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(CONF_FILE) $(1)$(CONF_DIR)
endef

$(eval $(call BuildPackage,owrt_notifications))
