include $(TOPDIR)/rules.mk

PKG_NAME:=owrt-1wire-protocol
PKG_VERSION=1.0
PKG_REV:=76052d77aeefd19763d9774f064288f816381435
PKG_RELEASE:=26

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-1wire-protocol.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-1wire-protocol
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=internal 1-wire communication module
  URL:=https://github.com/Netping/OWRT-1wire-protocol
  MAINTAINER:=Alexander Shenshin <info@netping.ru>
  DEPENDS:=+owrt-log +owfs +owrt-plib-ubus
endef

define Package/owrt-1wire-protocol/description
 Internal 1-wire communication module
endef

MODULE_FILES:=owrt-1wire-protocol.py
MODULE_FILES_DIR:=/etc/netping/$(PKG_NAME)/
SOURCE_FILES_DIR:=/etc/

CONF_FILE:=owrt-1wire-protocol
CONF_DIR:=/etc/config/
RUN_SOURCE_FILE:=owrt-1wire-protocol-autorun
RUN_DEST_FILE:=owrt-1wire-protocol
RUN_DIR:=/etc/init.d/

ACL_FILE:=owrt-1wire-protocol.json
ACL_DIR:=/usr/share/acl.d/

define Package/owrt-1wire-protocol/conffiles
 $(CONF_DIR)$(CONF_FILE)
endef

define Package/owrt-1wire-protocol/Configure
	chmod 640 $(1)$(ACL_DIR)$(ACL_FILE)
endef

define Build/Prepare
	$(Build/Prepare/Default)
	$(CP) $(CONF_FILE) $(PKG_BUILD_DIR)
endef

define Package/owrt-1wire-protocol/install
	$(INSTALL_DIR) $(1)$(CONF_DIR)
	$(INSTALL_DIR) $(1)$(MODULE_FILES_DIR)
	$(INSTALL_DIR) $(1)$(RUN_DIR)
	$(INSTALL_DIR) $(1)$(ACL_DIR)

	$(INSTALL_CONF) $(PKG_BUILD_DIR)/$(CONF_FILE) $(1)$(CONF_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)$(SOURCE_FILES_DIR)$(MODULE_FILES) $(1)$(MODULE_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(RUN_SOURCE_FILE) $(1)$(RUN_DIR)$(RUN_DEST_FILE)
	$(CP) $(PKG_BUILD_DIR)/$(ACL_FILE) $(1)$(ACL_DIR)

endef

define Package/owrt-1wire-protocol/clean
	rm -f $(1)$(CONF_DIR)$(CONF_FILE)
	rm -rf $(1)$(MODULE_FILES_DIR)
	rm -f $(1)$(RUN_DIR)$(RUN_DEST_FILE)
	rm -f $(1)$(ACL_DIR)$(ACL_FILE)
endef

$(eval $(call BuildPackage,owrt-1wire-protocol))
