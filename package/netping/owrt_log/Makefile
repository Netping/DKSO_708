include $(TOPDIR)/rules.mk

PKG_NAME="owrt_log"
PKG_VERSION=4.1.1
PKG_RELEASE=6

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt_log-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/Netping/OWRT_Log/files/7413340/
PKG_HASH:=0d3a46e65f01776ae71cd2a39b54dd9d1e98ee923e84365dbea505710059f00b

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt_log
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Utils and boot scripts
  TITLE:=operation logging module
  URL:=https://github.com/Netping/OWRT_Log
  MAINTAINER:=Leonid Khlebushchev <info@netping.ru>
endef

define Package/owrt_log/description
 Operation logging module
endef

MODULE_FILE:=journal.py
MODULE_FILES_DIR:=/usr/lib/python3.7/site-packages/

ETC_FILE1:=system_hash
ETC_FILE2:=journal_hash
ETC_FILE3:=Configname
ETC_FILE4:=Help
ETC_FILES_DIR:=/etc/netping_log/

CONF_FILE:=journalconf
CONF_DIR:=/etc/config/

ETC_FILES_COMMANDS:=cmd_show.py
ETC_FILES_COMMANDS_DIR:=commands

define Package/owrt_log/install
	mkdir -p $(1)$(CONF_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(CONF_FILE) $(1)$(CONF_DIR)
	mkdir -p $(1)$(MODULE_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(MODULE_FILE) $(1)$(MODULE_FILES_DIR)
	mkdir -p $(1)$(ETC_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/$(ETC_FILE1) $(1)$(ETC_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/$(ETC_FILE2) $(1)$(ETC_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/$(ETC_FILE3) $(1)$(ETC_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/$(ETC_FILE4) $(1)$(ETC_FILES_DIR)
	mkdir -p $(1)$(ETC_FILES_DIR)$(ETC_FILES_COMMANDS_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/$(ETC_FILES_COMMANDS) $(1)$(ETC_FILES_DIR)$(ETC_FILES_COMMANDS_DIR)
endef

$(eval $(call BuildPackage,owrt_log))
