include $(TOPDIR)/rules.mk

PKG_NAME:="owrt_sensor_value"
PKG_VERSION=0.1
PKG_REV:=3d6ecb72313b09cfcfaa98b7abeb6484e095c182
PKG_RELEASE:=10

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt_sensor_value-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Netping/OWRT-sensor-value.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt_sensor_value
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=module for sensors returning a digital values
  URL:=https://github.com/Netping/OWRT-sensor-value
  MAINTAINER:=Aleksandr Shenshin <info@netping.ru>
  DEPENDS:= +owrt_log +owrt_snmp_protocol +owrt_cli +owrt_plib_lark_parser
endef

define Package/owrt_sensor_value/description
 Module for sensors returning a digital values
endef

MODULE_FILES_DIR:=/usr/lib/python3.7/site-packages/

CONF_FILES:=owrt_sensor_value
CONF_DIR:=/etc/config/

ETC_FILES:=owrt_sensor_value.py
ETC_FILES_DIR:=/etc/netping/OWRT-sensor-value/

CLI_COMMANDS_DIR:=commands
CLI_HELP_FILE:=Help
CLI_CONFIGNAME:=Configname

RUN_SOURCE_FILE:=owrt_sensor_value_autorun
RUN_DEST_FILE:=owrt-sensor-value
RC_RUN_DEST_FILE:=S90OWRT-Sensor-value
RUN_DIR:=/etc/init.d/
RC_RUN_DIR:=/etc/rc.d/


define Package/owrt_sensor_value/install
	mkdir -p $(1)$(CONF_DIR)
	cp -r $(PKG_BUILD_DIR)/$(CONF_FILES) $(1)$(CONF_DIR)
	mkdir -p $(1)$(ETC_FILES_DIR)
	cp -r $(PKG_BUILD_DIR)/etc/$(ETC_FILES) $(1)$(ETC_FILES_DIR)
	cp -r $(PKG_BUILD_DIR)/$(CLI_COMMANDS_DIR) $(1)$(ETC_FILES_DIR)
	cp -r $(PKG_BUILD_DIR)/$(CLI_HELP_FILE) $(1)$(ETC_FILES_DIR)
	cp -r $(PKG_BUILD_DIR)/$(CLI_CONFIGNAME) $(1)$(ETC_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(RUN_SOURCE_FILE) $(1)$(RUN_DIR)$(RUN_DEST_FILE)
	ln -s $(1)$(RUN_DIR)$(RUN_DEST_FILE) $(1)$(RC_RUN_DIR)$(RC_RUN_DEST_FILE)
endef

define Package/owrt_sensor_value/clean
	rm -f $(1)$(CONF_DIR)$(CONF_FILES)
	rm -rf $(1)$(ETC_FILES_DIR)
	rm -f $(1)$(RC_RUN_DIR)$(RC_RUN_DEST_FILE)
	rm -f $(1)$(RUN_DIR)$(RUN_DEST_FILE)
endef

$(eval $(call BuildPackage,owrt_sensor_value))
