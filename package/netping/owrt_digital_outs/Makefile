include $(TOPDIR)/rules.mk

PKG_NAME:="owrt_digital_outs"
PKG_VERSION=1.2
PKG_REV:=b2c857d3fef2a12dc2092ebd5ca38833310ef062
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt_digital_outs-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Netping/OWRT_Digital_outs.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt_digital_outs
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=module for binary outputs control
  URL:=https://github.com/Netping/OWRT_Digital_outs
  MAINTAINER:=Aleksandr Shenshin <info@netping.ru>
  DEPENDS:= +owrt_log +owrt_snmp_protocol +owrt-plib-ubus
endef

define Package/owrt_digital_outs/description
 Module for sending email notifications
endef

CONF_FILE:=owrt_digital_outs
CONF_DIR:=/etc/config/

ETC_FILE:=owrt_digital_outs.py
ETC_DIR:=/etc/
ETC_FILES_DIR:=/etc/netping_digital_outs/

CLI_COMMANDS_DIR:=commands
CLI_HELP_FILE:=Help
CLI_CONFIGNAME:=Configname

EBNF_SRC_DIR:=ebnf
EBNF_FILES_DIR:=/etc/netping_digital_outs/ebnf/

define Package/owrt_digital_outs/install
	mkdir -p $(1)$(CONF_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(CONF_FILE) $(1)$(CONF_DIR)
	mkdir -p $(1)$(ETC_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)$(ETC_DIR)$(ETC_FILE) $(1)$(ETC_FILES_DIR)
	mkdir -p $(1)$(ETC_FILES_DIR)$(CLI_COMMANDS_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(CLI_COMMANDS_DIR)/* $(1)$(ETC_FILES_DIR)$(CLI_COMMANDS_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(CLI_HELP_FILE) $(1)$(ETC_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(CLI_CONFIGNAME) $(1)$(ETC_FILES_DIR)
	mkdir -p $(1)$(EBNF_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(EBNF_SRC_DIR)/*.py $(1)$(EBNF_FILES_DIR)
endef

$(eval $(call BuildPackage,owrt_digital_outs))
