include $(TOPDIR)/rules.mk

PKG_NAME="owrt-log"
PKG_VERSION=1.1
PKG_REV:=f16185690c225340bef78d2153e025d60cadf573
PKG_RELEASE=16

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-log-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT_Log.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-log
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=operation logging module
  URL:=https://github.com/Netping/OWRT_Log
  MAINTAINER:=Leonid Khlebushchev <info@netping.ru>
  DEPENDS:=+owrt-plib-ubus
endef

define Package/owrt-log/description
 Operation logging module
endef

MODULE_FILE:=journal.py
MODULE_FILES_DIR:=/usr/lib/python3.7/site-packages/

ETC_FILE1:=journald.py
ETC_FILE2:=Help
ETC_FILES_DIR:=/etc/netping/log/

CONF_FILE:=journalconf
CONF_DIR:=/etc/config/

ETC_FILES_COMMANDS:=cmd_show.py
ETC_FILES_COMMANDS_DIR:=commands

RUN_SOURCE_FILE:=owrt_log_autorun
RUN_DEST_FILE:=owrt_log
RC_RUN_DEST_FILE:=S88OWRT-Log
RUN_DIR:=/etc/init.d/
RC_RUN_DIR:=/etc/rc.d/

ACL_DIR:=/usr/share/acl.d/
ACL_FILE:=owrt-log.json

define Package/owrt-log/conffiles
	$(CONF_DIR)$(CONF_FILE)
endef

define Package/owrt-log/Configure
	chmod 640 $(1)$(ACL_DIR)$(ACL_FILE)
endef

define Package/owrt-log/install

	$(INSTALL_DIR) $(1)$(CONF_DIR)
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/$(CONF_FILE) $(1)$(CONF_DIR)	
	
	$(INSTALL_DIR) $(1)$(MODULE_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(MODULE_FILE) $(1)$(MODULE_FILES_DIR)	
	
#	mkdir -p $(1)$(ETC_FILES_DIR)
	$(INSTALL_DIR) $(1)$(ETC_FILES_DIR)$(ETC_FILES_COMMANDS_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/$(ETC_FILE1) $(1)$(ETC_FILES_DIR)
	$(CP) $(PKG_BUILD_DIR)/etc/$(ETC_FILE2) $(1)$(ETC_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/$(ETC_FILES_COMMANDS) $(1)$(ETC_FILES_DIR)$(ETC_FILES_COMMANDS_DIR)	
	
	$(INSTALL_DIR) $(1)$(RUN_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(RUN_SOURCE_FILE) $(1)$(RUN_DIR)$(RUN_DEST_FILE)	
	
	$(INSTALL_DIR) $(1)$(ACL_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(ACL_FILE) $(1)$(ACL_DIR)

endef

define Package/owrt-log/clean
	rm -f $(1)$(ACL_DIR)$(ACL_FILE)
	rm -f $(1)$(CONF_DIR)$(CONF_FILE)
	rm -rf $(1)$(ETC_FILES_DIR)
	rm -f $(1)$(RUN_DIR)$(RUN_DEST_FILE)

endef

$(eval $(call BuildPackage,owrt-log))
