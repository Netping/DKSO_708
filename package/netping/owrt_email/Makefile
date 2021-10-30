include $(TOPDIR)/rules.mk

PKG_NAME="owrt_email"
PKG_VERSION=2.1.1
PKG_REV:=a6c4931280a370fd11b0b8a20e070583d522241c
PKG_RELEASE=16

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
  SUBMENU:=Utils and boot scripts
  TITLE:=module for sending email notifications
  URL:=https://github.com/Netping/OWRT_Email
  MAINTAINER:=Leonid Khlebushchev <info@netping.ru>
endef

define Package/owrt_email/description
 Module for sending email notifications
endef

CONF_FILE:=smtpconf
CONF_DIR:=/etc/config/

MODULE_FILES:=smtpmail.py
MODULE_FILES_DIR:=/usr/lib/python3.7/site-packages/

ETC_FILES:=Configname
ETC_FILES_DIR:=/etc/netping_email/
ETC_FILES_COMMANDS:=cmd_sendmail.py
ETC_FILES_COMMANDS_DIR:=commands

EBNF_DIR:=frontend/model/ebnf
COMPILED_EBNF_DIR:=grammars
F:=port.ne
fname:=$(shell echo $(F) | sed 's/\(.*\)\..*/\1/')

define Package/owrt_email/install
	mkdir -p $(1)$(CONF_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(CONF_FILE) $(1)$(CONF_DIR)
	mkdir -p $(1)$(MODULE_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(MODULE_FILES) $(1)$(MODULE_FILES_DIR)
	mkdir -p $(1)$(ETC_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/$(ETC_FILES) $(1)$(ETC_FILES_DIR)
	mkdir -p $(1)$(ETC_FILES_DIR)$(ETC_FILES_COMMANDS_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/$(ETC_FILES_COMMANDS) $(1)$(ETC_FILES_DIR)$(ETC_FILES_COMMANDS_DIR)
	mkdir -p $(1)$(ETC_FILES_DIR)$(COMPILED_EBNF_DIR)
	python3 -m lark.tools.nearley $(PKG_BUILD_DIR)/$(EBNF_DIR)/$(F) main ./nearley > $(PKG_BUILD_DIR)/$(fname).py
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(fname).py $(1)$(ETC_FILES_DIR)$(COMPILED_EBNF_DIR)/$(fname).py
endef

$(eval $(call BuildPackage,owrt_email))

