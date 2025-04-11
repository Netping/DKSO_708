include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-digital-inputs"
PKG_VERSION=0.2
PKG_REV:=df261a8f623526fe7f0f55b2e1b33e5eac10a18f
PKG_RELEASE:=47

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-digital-inputs-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-digital-inputs.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-digital-inputs
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=input lines module
  URL:=https://github.com/Netping/OWRT-digital-inputs
  MAINTAINER:=Egor Zyryanov <info@netping.ru>
  DEPENDS:= +owrt-log +owrt-snmp-protocol +owrt-plib-ubus
endef

define Package/owrt-digital-inputs/description
 Input lines module
endef

MODULE_FILES_DIR:=/usr/lib/python3.7/site-packages/

ETC_FILE1:=Configname
ETC_FILE2:= owrt_digital_inputs.py
ETC_FILES_DIR:=/etc/netping/owrt-digital-inputs

CONF_FILE_1:=diginsensorconf
CONF_FILE_2:=diginstaticonf
CONF_DIR:=/etc/config

SOURCE_CLI_COMMANDS_DIR:=etc
CLI_HELP_FILE:=Help
CLI_CONFIGNAME:=Configname
CLI_COMMANDS_DIR:=commands

SNMP_AGENT_DIR:=/etc/netping/owrt-digital-inputs/snmp_oid
SNMP_AGENT_FILE:=owrtdigitalinputs_oid.py

RUN_SOURCE_FILE:=owrt_digital_inputs_autorun
RUN_DEST_FILE:=owrt_digital_inputs
RUN_DIR:=/etc/init.d

ACL_DIR:=/usr/share/acl.d/
ACL_FILE:=owrt-digital-inputs.json

define Package/owrt-digital-inputs/conffiles
	$(CONF_DIR)/$(CONF_FILE_1)
	$(CONF_DIR)/$(CONF_FILE_2)
endef

define Package/owrt-digital-inputs/Configure
	chmod 640 $(1)$(ACL_DIR)$(ACL_FILE)
endef

define Build/Prepare
	$(Build/Prepare/Default)
	$(CP) {$(CONF_FILE_1),$(CONF_FILE_2)} $(PKG_BUILD_DIR)
endef

define Package/owrt-digital-inputs/install
	#Install config files
	$(INSTALL_DIR) $(1)$(CONF_DIR)
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/{$(CONF_FILE_1),$(CONF_FILE_2)} $(1)$(CONF_DIR)
	
	#Install module files
	$(INSTALL_DIR) $(1)$(ETC_FILES_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(ETC_FILE1) $(1)$(ETC_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(ETC_FILE2) $(1)$(ETC_FILES_DIR)
	
	#Install autorun files
	$(INSTALL_DIR) $(1)$(RUN_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(RUN_SOURCE_FILE) $(1)$(RUN_DIR)/$(RUN_DEST_FILE)
	
	#Install SNMP agent files
	$(INSTALL_DIR) $(1)$(SNMP_AGENT_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(SNMP_AGENT_FILE) $(1)$(SNMP_AGENT_DIR)

	
	#Install CLI interface files
	$(INSTALL_DIR) $(1)$(ETC_FILES_DIR)/$(CLI_COMMANDS_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(SOURCE_CLI_COMMANDS_DIR)/* $(1)$(ETC_FILES_DIR)/$(CLI_COMMANDS_DIR)
	$(CP) $(PKG_BUILD_DIR)/{$(CLI_HELP_FILE),$(CLI_CONFIGNAME)} $(1)$(ETC_FILES_DIR)/

	#Install ACL files
	$(INSTALL_DIR) $(1)$(ACL_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(ACL_FILE) $(1)$(ACL_DIR)
endef

define Package/owrt-digital-inputs/clean
	rm -f $(1)$(CONF_DIR)/$(CONF_FILE_1)
	rm -f $(1)$(CONF_DIR)/$(CONF_FILE_2)
	rm -rf $(1)$(ETC_FILES_DIR)
###	rm -f $(1)$(RC_RUN_DIR)$(RC_RUN_DEST_FILE)
	rm -f $(1)$(RUN_DIR)/$(RUN_DEST_FILE)
	rm -f $(1)$(SNMP_AGENT_DIR)/$(SNMP_AGENT_FILE)
	rm -f $(1)$(ACL_DIR)$(ACL_FILE)
endef

$(eval $(call BuildPackage,owrt-digital-inputs))