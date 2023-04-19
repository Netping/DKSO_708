include $(TOPDIR)/rules.mk

PKG_NAME="owrt_log"
PKG_VERSION=1.1
PKG_REV:=1e4d4d34eb987606ad10e3ab871f779206636d09
PKG_RELEASE=6

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt_log-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Netping/OWRT_Log.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt_log
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=operation logging module
  URL:=https://github.com/Netping/OWRT_Log
  MAINTAINER:=Leonid Khlebushchev <info@netping.ru>
  DEPENDS:=+owrt-plib-ubus
endef

define Package/owrt_log/description
 Operation logging module
endef

MODULE_FILE:=journal.py
MODULE_FILES_DIR:=/usr/lib/python3.7/site-packages/

ETC_FILE1:=journald.py
ETC_FILE2:=Help
ETC_FILES_DIR:=/etc/netping_log/

CONF_FILE:=journalconf
CONF_DIR:=/etc/config/

ETC_FILES_COMMANDS:=cmd_show.py
ETC_FILES_COMMANDS_DIR:=commands

RUN_SOURCE_FILE:=owrt_log_autorun
RUN_DEST_FILE:=owrt_log
RC_RUN_DEST_FILE:=S90OWRT-Log
RUN_DIR:=/etc/init.d/
RC_RUN_DIR:=/etc/rc.d/

define Package/owrt_log/install
	mkdir -p $(1)$(CONF_DIR)
	mkdir -p $(1)$(MODULE_FILES_DIR)
	mkdir -p $(1)$(ETC_FILES_DIR)
	mkdir -p $(1)$(ETC_FILES_DIR)$(ETC_FILES_COMMANDS_DIR)
	mkdir -p $(1)$(RUN_DIR)
	mkdir -p $(1)$(RC_RUN_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(CONF_FILE) $(1)$(CONF_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(MODULE_FILE) $(1)$(MODULE_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/$(ETC_FILE1) $(1)$(ETC_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/$(ETC_FILE2) $(1)$(ETC_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/$(ETC_FILES_COMMANDS) $(1)$(ETC_FILES_DIR)$(ETC_FILES_COMMANDS_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(RUN_SOURCE_FILE) $(1)$(RUN_DIR)$(RUN_DEST_FILE)
###	ln -s $(1)$(RUN_DIR)$(RUN_DEST_FILE) $(1)$(RC_RUN_DIR)$(RC_RUN_DEST_FILE)
endef

define Package/owrt_log/clean
	rm -f $(1)$(CONF_DIR)$(CONF_FILE)
	rm -rf $(1)$(ETC_FILES_DIR)
###	rm -f $(1)$(RC_RUN_DIR)$(RC_RUN_DEST_FILE)
	rm -f $(1)$(RUN_DIR)$(RUN_DEST_FILE)
endef

$(eval $(call BuildPackage,owrt_log))
