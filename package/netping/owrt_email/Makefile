include $(TOPDIR)/rules.mk

PKG_NAME="owrt_email"
PKG_VERSION=0.2
PKG_REV:=025596335cae67fcf88ef123ef046881a19d853b
PKG_RELEASE=8

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt_email-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Netping/OWRT_email.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt_email
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=module for sending email notifications
  URL:=https://github.com/Netping/OWRT_Email
  MAINTAINER:=Leonid Khlebushchev <info@netping.ru>
  DEPENDS:= +owrt_log +owrt-plib-ubus
endef

define Package/owrt_email/description
 Module for sending email notifications
endef

CONF_FILE:=smtpconf
CONF_DIR:=/etc/config/

MODULE_FILES:=smtpmail.py
MODULE_FILES_DIR:=/usr/lib/python3.7/site-packages/

ETC_FILE1:=Configname
ETC_FILE2:=smtpmaild.py
ETC_FILE3:=smtphash
ETC_FILES_DIR:=/etc/netping_email/
ETC_FILES_COMMANDS:=cmd_sendmail.py
ETC_FILES_COMMANDS_DIR:=commands

RUN_SOURCE_FILE:=owrt_email_autorun
RUN_DEST_FILE:=owrt_email
RC_RUN_DEST_FILE:=S90OWRT-Email
RUN_DIR:=/etc/init.d/
RC_RUN_DIR:=/etc/rc.d/

define Package/owrt_email/install
	mkdir -p $(1)$(CONF_DIR)
	mkdir -p $(1)$(MODULE_FILES_DIR)
	mkdir -p $(1)$(ETC_FILES_DIR)
	mkdir -p $(1)$(ETC_FILES_DIR)$(ETC_FILES_COMMANDS_DIR)
	mkdir -p $(1)$(RUN_DIR)
	mkdir -p $(1)$(RC_RUN_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(CONF_FILE) $(1)$(CONF_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(MODULE_FILES) $(1)$(MODULE_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/$(ETC_FILE1) $(1)$(ETC_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/$(ETC_FILE2) $(1)$(ETC_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/$(ETC_FILE3) $(1)$(ETC_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/$(ETC_FILES_COMMANDS) $(1)$(ETC_FILES_DIR)$(ETC_FILES_COMMANDS_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(RUN_SOURCE_FILE) $(1)$(RUN_DIR)$(RUN_DEST_FILE)
	ln -s $(1)$(RUN_DIR)$(RUN_DEST_FILE) $(1)$(RC_RUN_DIR)$(RC_RUN_DEST_FILE)
endef

define Package/owrt_email/clean
	rm -f $(1)$(CONF_DIR)$(CONF_FILE)
	rm -rf $(1)$(ETC_FILES_DIR)
	rm -f $(1)$(RC_RUN_DIR)$(RC_RUN_DEST_FILE)
	rm -f $(1)$(RUN_DIR)$(RUN_DEST_FILE)
endef

$(eval $(call BuildPackage,owrt_email))

