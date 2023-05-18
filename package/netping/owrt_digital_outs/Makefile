include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-digital-outs"
PKG_VERSION=0.2
PKG_REV:=b2c857d3fef2a12dc2092ebd5ca38833310ef062
PKG_RELEASE:=18

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-digital-outs-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Netping/owrt-digital-outs.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-digital-outs
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=module for binary outputs control
  URL:=https://github.com/Netping/owrt-digital-outs
  MAINTAINER:=Aleksandr Shenshin <info@netping.ru>
  DEPENDS:= +owrt_log +owrt_snmp_protocol +owrt-plib-ubus
endef

define Package/owrt-digital-outs/description
 Module for sending email notifications
endef

CONF_FILE:=owrt-digital-outs
CONF_DIR:=/etc/config/

ETC_FILE:=owrt-digital-outs.py
ETC_DIR:=/etc/
ETC_FILES_DIR:=/etc/netping/OWRT-digital-outs/

CLI_COMMANDS_DIR:=commands
CLI_HELP_FILE:=Help
CLI_CONFIGNAME:=Configname

SNMP_AGENT_DIR=snmp_oid

RUN_SOURCE_FILE:=owrt-digital-outs-autorun
RUN_DEST_FILE:=owrt-digital-outs
RC_RUN_DEST_FILE:=S90OWRT-Digital-outs
RUN_DIR:=/etc/init.d/
RC_RUN_DIR:=/etc/rc.d/

define Package/owrt-digital-outs/install
	mkdir -p $(1)$(CONF_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(CONF_FILE) $(1)$(CONF_DIR)
	mkdir -p $(1)$(ETC_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)$(ETC_DIR)$(ETC_FILE) $(1)$(ETC_FILES_DIR)
	mkdir -p $(1)$(ETC_FILES_DIR)$(CLI_COMMANDS_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(CLI_COMMANDS_DIR)/* $(1)$(ETC_FILES_DIR)$(CLI_COMMANDS_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(CLI_HELP_FILE) $(1)$(ETC_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(CLI_CONFIGNAME) $(1)$(ETC_FILES_DIR)
	mkdir -p $(1)$(RUN_DIR)
	mkdir -p $(1)$(RC_RUN_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(RUN_SOURCE_FILE) $(1)$(RUN_DIR)$(RUN_DEST_FILE)
###	ln -s $(1)$(RUN_DIR)$(RUN_DEST_FILE) $(1)$(RC_RUN_DIR)$(RC_RUN_DEST_FILE)
endef

define Package/owrt-digital-outs/clean
	rm -f $(1)$(CONF_DIR)$(CONF_FILE)
	rm -rf $(1)$(ETC_FILES_DIR)
###	rm -f $(1)$(RC_RUN_DIR)$(RC_RUN_DEST_FILE)
	rm -f $(1)$(RUN_DIR)$(RUN_DEST_FILE)
endef

$(eval $(call BuildPackage,owrt-digital-outs))
