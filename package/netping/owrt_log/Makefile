include $(TOPDIR)/rules.mk

PKG_NAME="owrt_log"
PKG_VERSION=1.1
PKG_REV:=768fb099cb138ecee91eca4a844474b052a53c55
PKG_RELEASE=2

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
