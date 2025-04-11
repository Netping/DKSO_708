include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-digital-outs"
PKG_VERSION=0.3
PKG_REV:=723af042bbe642bf4ab7dfdf93d251af8f22ba45
PKG_RELEASE:=98

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-digital-outs-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/owrt-digital-outs.git
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
  DEPENDS:= +owrt-log +owrt-snmp-protocol +owrt-plib-ubus +owrt-gpio-protocol
endef



CONF_FILE_1:=digital-outs-conf
CONF_FILE_2:=digital-outs-stat
CONF_DIR:=/etc/config

ETC_FILE:=owrt-digital-outs.py
ETC_DIR:=/etc
ETC_FILES_DIR:=/etc/netping/owrt-digital-outs

CLI_COMMANDS_DIR:=commands
CLI_HELP_FILE:=Help
CLI_CONFIGNAME:=Configname

SNMP_AGENT_DIR:=snmp_oid
SNMP_AGENT_FILE:=owrtdigitalouts_oid.py

RUN_SOURCE_FILE:=owrt-digital-outs-autorun
RUN_DEST_FILE:=owrt-digital-outs
RUN_DIR:=/etc/init.d/

ACL_FILE:=owrt-digital-outs.json
ACL_DIR:=/usr/share/acl.d/

define Package/owrt-digital-outs/description
 Module for sending email notifications
endef

define Package/owrt-digital-outs/conffiles
	$(CONF_DIR)/$(CONF_FILE_1)
	$(CONF_DIR)/$(CONF_FILE_2)
endef

define Package/owrt-digital-outs/Configure
	chmod a=r $(1)$(CONF_DIR)/digital-outs-stat
	chmod 640 $(1)$(ACL_DIR)$(ACL_FILE)

endef


define Build/Prepare
	$(Build/Prepare/Default)
	$(CP) {$(CONF_FILE_1),$(CONF_FILE_2)} $(PKG_BUILD_DIR)
endef

define Package/owrt-digital-outs/install
	#Install config files
	$(INSTALL_DIR) $(1)$(CONF_DIR)
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/{$(CONF_FILE_1),$(CONF_FILE_2)} $(1)$(CONF_DIR)
	
	#Install module files
	$(INSTALL_DIR) $(1)$(ETC_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)$(ETC_DIR)/$(ETC_FILE) $(1)$(ETC_FILES_DIR)/
	
	#Install SNMP agent files
	$(INSTALL_DIR) $(1)$(ETC_FILES_DIR)/$(SNMP_AGENT_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(SNMP_AGENT_DIR)/$(SNMP_AGENT_FILE) $(1)$(ETC_FILES_DIR)/$(SNMP_AGENT_DIR)
	
	#Install CLI interface files
	$(INSTALL_DIR) $(1)$(ETC_FILES_DIR)/$(CLI_COMMANDS_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(CLI_COMMANDS_DIR)/* $(1)$(ETC_FILES_DIR)/$(CLI_COMMANDS_DIR)
	$(CP) $(PKG_BUILD_DIR)/{$(CLI_HELP_FILE),$(CLI_CONFIGNAME)} $(1)$(ETC_FILES_DIR)

	
	#Install autorun files
	$(INSTALL_DIR) $(1)$(RUN_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(RUN_SOURCE_FILE) $(1)$(RUN_DIR)/$(RUN_DEST_FILE)
###	ln -s $(1)$(RUN_DIR)$(RUN_DEST_FILE) $(1)$(RC_RUN_DIR)$(RC_RUN_DEST_FILE)

	#Install ACL files
	$(INSTALL_DIR) $(1)$(ACL_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(ACL_FILE) $(1)$(ACL_DIR)
endef

define Package/owrt-digital-outs/clean
	rm -f $(1)$(CONF_DIR)/$(CONF_FILE_1)
	rm -f $(1)$(CONF_DIR)/$(CONF_FILE_2)
	rm -rf $(1)$(ETC_FILES_DIR)
###	rm -f $(1)$(RC_RUN_DIR)$(RC_RUN_DEST_FILE)
	rm -f $(1)$(RUN_DIR)/$(RUN_DEST_FILE)
	rm -f $(1)$(ACL_DIR)$(ACL_FILE)
endef

$(eval $(call BuildPackage,owrt-digital-outs))
