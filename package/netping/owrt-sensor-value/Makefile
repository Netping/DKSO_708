include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-sensor-value"
PKG_VERSION=0.3
PKG_REV:=f0f95a05ddaa215ccb95e2eca834d1b2566aa772
PKG_RELEASE:=111

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-sensor-value-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-sensor-value.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-sensor-value
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=module for sensors returning a digital values
  URL:=https://github.com/Netping/OWRT-sensor-value
  MAINTAINER:=Aleksandr Shenshin <info@netping.ru>
  DEPENDS:= +owrt-log +owrt-snmp-protocol +owrt-cli +owrt-plib-ubus
endef

define Package/owrt-sensor-value/description
 Module for sensors returning a digital values
endef

MODULE_FILES_DIR:=/usr/lib/python3.7/site-packages/

CONF_FILES:=owrt-sensor-value
CONF_DIR:=/etc/config/

ETC_FILES:=owrt-sensor-value.py
ETC_FILES_DIR:=/etc/netping/$(PKG_NAME)/

CLI_COMMANDS_DIR:=commands
CLI_HELP_FILE:=Help
CLI_CONFIGNAME:=Configname

TEMPLATES:=templates

SNMP_AGENT_DIR:=snmp_oid

RUN_SOURCE_FILE:=owrt_sensor_value_autorun
RUN_DEST_FILE:=owrt-sensor-value
RUN_DIR:=/etc/init.d/

ACL_FILE:=owrt-sensor-value.json
ACL_DIR:=/usr/share/acl.d/

define Package/owrt-sensor-value/conffiles
	$(CONF_DIR)$(CONF_FILES)
endef

define Package/owrt-sensor-value/Configure
	chmod 640 $(1)$(ACL_DIR)$(ACL_FILE)
endef


define Build/Prepare
	$(Build/Prepare/Default)
	$(CP) $(CONF_FILES) $(PKG_BUILD_DIR)
endef

define Package/owrt-sensor-value/install
	$(INSTALL_DIR) $(1)$(CONF_DIR)
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/$(CONF_FILES) $(1)$(CONF_DIR)
	
	$(INSTALL_DIR) $(1)$(ETC_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/$(ETC_FILES) $(1)$(ETC_FILES_DIR)
	
	$(INSTALL_DIR) $(1)$(ETC_FILES_DIR)$(CLI_COMMANDS_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(CLI_COMMANDS_DIR)/* $(1)$(ETC_FILES_DIR)$(CLI_COMMANDS_DIR)
	$(CP) $(PKG_BUILD_DIR)/{$(CLI_HELP_FILE),$(CLI_CONFIGNAME)} $(1)$(ETC_FILES_DIR)

	$(INSTALL_DIR) $(1)$(ETC_FILES_DIR)$(TEMPLATES)
	cp -r $(PKG_BUILD_DIR)/$(TEMPLATES)/* $(1)$(ETC_FILES_DIR)$(TEMPLATES)

	$(INSTALL_DIR) $(1)$(ETC_FILES_DIR)$(SNMP_AGENT_DIR)
	cp -r $(PKG_BUILD_DIR)/$(SNMP_AGENT_DIR)/* $(1)$(ETC_FILES_DIR)$(SNMP_AGENT_DIR)


	$(INSTALL_DIR) $(1)$(RUN_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(RUN_SOURCE_FILE) $(1)$(RUN_DIR)$(RUN_DEST_FILE)
###	ln -s $(1)$(RUN_DIR)$(RUN_DEST_FILE) $(1)$(RC_RUN_DIR)$(RC_RUN_DEST_FILE)

	$(INSTALL_DIR) $(1)$(ACL_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(ACL_FILE) $(1)$(ACL_DIR)

endef

define Package/owrt-sensor-value/clean
	rm -f $(1)$(CONF_DIR)$(CONF_FILES)
	rm -rf $(1)$(ETC_FILES_DIR)
###	rm -f $(1)$(RC_RUN_DIR)$(RC_RUN_DEST_FILE)
	rm -f $(1)$(RUN_DIR)$(RUN_DEST_FILE)
	rm -f $(1)$(ACL_DIR)$(ACL_FILE)
endef

$(eval $(call BuildPackage,owrt-sensor-value))
