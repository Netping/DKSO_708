include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-sms-protocol"
PKG_VERSION=0.2
PKG_REV:=52d7d1a2293f5c6182e1ffc5ab151bc9ebbe02fe
PKG_RELEASE:=71

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-sms-protocol-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-sms-protocol.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-sms-protocol
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=Modem protocol support module
  URL:=https://github.com/Netping/OWRT-sms-Protocol
  MAINTAINER:=Egor Zyryanov <info@netping.ru>
  DEPENDS:= +owrt-log +owrt-plib-pyserial +owrt-plib-ubus +python3-dbus +python3-dbus-next +modemmanager
endef

define Package/owrt-sms-protocol/description
	Modem protocol support module
endef

CONF_FILE=modemconf
CONF_DIR:=/etc/config/

MODULE_FILES_1:=modemproto.py
MODULE_FILES_2:=modemerror.py
MODULE_FILES_3:=dbus_sms_listener.py
MODULE_FILES_DIR:=/usr/lib/python3.7/

ETC_FILES:=Configname
ETC_FILES_DIR:=/etc/netping/owrt-sms-protocol/

CLI_FILES_COMMANDS:=cmd_getmodemstate.py  cmd_sendsms.py  cmd_sendussd.py
CLI_COMMANDS_DIR:=commands/

RUN_SRC_FILES:=owrt_modem-protocol_autorun
RUN_DST_FILES:=owrt_modem-protocol

SNMP_AGENT_DIR:=/etc/netping/owrt-sms-protocol/snmp_oid/
SNMP_AGENT_FILES:=owrtsmsprotocol_oid.py

RUN_DIR:=/etc/init.d/

ACL_DIR:=/usr/share/acl.d/
ACL_FILE:=owrt-sms-protocol.json

MODEM_TYPE:=MMModem

define Package/owrt-sms-protocol/preinst
	#!/bin/sh
	$(shell sed "s/%TEMPLATE_MODEM%/$(MODEM_TYPE)/g" $(PKG_BUILD_DIR)/modemproto.py.in > $(PKG_BUILD_DIR)/modemproto.py)
endef

define Package/owrt-sms-protocol/conffiles
	$(CONF_DIR)$(CONF_FILE)
endef

define Package/owrt-sms-protocol/Configure
	chmod 640 $(1)$(ACL_DIR)$(ACL_FILE)
endef


define Build/Prepare
	$(Build/Prepare/Default)
	$(CP) $(CONF_FILE) $(PKG_BUILD_DIR)
endef

define Package/owrt-sms-protocol/install
	#Install config files
	$(INSTALL_DIR) $(1)$(CONF_DIR)
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/$(CONF_FILE) $(1)$(CONF_DIR)
	
	#Install module files
	$(INSTALL_DIR) $(1)$(MODULE_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/{$(MODULE_FILES_1),$(MODULE_FILES_2),$(MODULE_FILES_3)} $(1)$(MODULE_FILES_DIR)
	
	#Install SNMP agent files
#	mkdir -p $(1)$(ETC_FILES_DIR)$(SNMP_AGENT_DIR)
	$(INSTALL_DIR) $(1)$(SNMP_AGENT_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(SNMP_AGENT_FILES) $(1)$(SNMP_AGENT_DIR)
	
	#Install CLI interface files
	$(INSTALL_DIR) $(1)$(ETC_FILES_DIR)$(CLI_COMMANDS_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/$(CLI_COMMANDS_DIR)* $(1)$(ETC_FILES_DIR)$(CLI_COMMANDS_DIR)

	
	#Install autorun files
	$(INSTALL_DIR) $(1)$(RUN_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(RUN_SRC_FILES) $(1)$(RUN_DIR)$(RUN_DST_FILES)	

	#Install ACL files
	$(INSTALL_DIR) $(1)$(ACL_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(ACL_FILE) $(1)$(ACL_DIR)

endef

define Package/owrt-sms-protocol/clean
	rm -f $(1)$(MODULE_FILES_DIR)$(MODULE_FILES_1)
	rm -f $(1)$(MODULE_FILES_DIR)$(MODULE_FILES_2)
	rm -f $(1)$(MODULE_FILES_DIR)$(MODULE_FILES_3)
	rm -rf $(1)$(ETC_FILES_DIR)
	rm -f $(1)$(CONF_DIR)$(CONF_FILE)
	rm -f $(1)$(RUN_DIR)$(RUN_DST_FILES)
	rm -f $(1)$(ACL_DIR)$(ACL_FILE)

endef

$(eval $(call BuildPackage,owrt-sms-protocol))
