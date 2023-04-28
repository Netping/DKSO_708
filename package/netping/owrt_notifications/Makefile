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

MODULE_FILE1:=notify.py
MODULE_FILE2:=Configname
MODULE_FILES_DIR:=/etc/netping/notifications/

CONF_FILE:=notifyconf
CONF_DIR:=/etc/config/

RUN_SOURCE_FILE:=owrt_notifications_autorun
RUN_DEST_FILE:=owrt_notifications
RC_RUN_DEST_FILE:=S90OWRT-Notifications
RUN_DIR:=/etc/init.d/
RC_RUN_DIR:=/etc/rc.d/

define Package/owrt_notifications/install
	mkdir -p $(1)$(MODULE_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(MODULE_FILE1) $(1)$(MODULE_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(MODULE_FILE2) $(1)$(MODULE_FILES_DIR)
	mkdir -p $(1)$(CONF_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(CONF_FILE) $(1)$(CONF_DIR)
	mkdir -p $(1)$(RUN_DIR)
	mkdir -p $(1)$(RC_RUN_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(RUN_SOURCE_FILE) $(1)$(RUN_DIR)$(RUN_DEST_FILE)
###	ln -s $(1)$(RUN_DIR)$(RUN_DEST_FILE) $(1)$(RC_RUN_DIR)$(RC_RUN_DEST_FILE)
endef

define Package/owrt_notifications/clean
	rm -f $(1)$(CONF_DIR)$(CONF_FILE)
	rm -rf $(1)$(MODULE_FILES_DIR)
###	rm -f $(1)$(RC_RUN_DIR)$(RC_RUN_DEST_FILE)
	rm -f $(1)$(RUN_DIR)$(RUN_DEST_FILE)
endef

$(eval $(call BuildPackage,owrt_notifications))
