include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-snmp-agent"
PKG_VERSION=0.1
PKG_REV:=4264e1c6c33398097c3148ef0997c696c95acacd
PKG_RELEASE:=21

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-snmp-agent-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-snmp-agent.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-snmp-agent
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=SNMP support module
  URL:=https://github.com/Netping/OWRT-SNMP-agent
  MAINTAINER:=Aleksandr Shenshin <info@netping.ru>
  DEPENDS:= +snmpd +owrt-plib-ubus +owrt-log 
endef

define Package/owrt-snmp-agent/description
 SNMP support module
endef

MODULE_FILE_1:=owrt-snmp-agent-init.py
MODULE_FILE_2:=owrt-snmp-pass-agent.py
MODULE_FILE_3:=owrt-snmp-pass-agent.sh
MODULE_FILES_DIR:=/etc/netping/owrt-snmp-agent/

RUN_SOURCE_FILE:=owrt-snmp-agent-autorun
RUN_DEST_FILE:=owrt-snmp-agent

RUN_DIR:=/etc/init.d/


define Package/owrt-snmp-agent/install
	$(INSTALL_DIR) $(1)$(MODULE_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/{$(MODULE_FILE_1),$(MODULE_FILE_2),$(MODULE_FILE_3)} $(1)$(MODULE_FILES_DIR)

	
	$(INSTALL_DIR) $(1)$(RUN_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(RUN_SOURCE_FILE) $(1)$(RUN_DIR)$(RUN_DEST_FILE)
endef

define Package/owrt-snmp-agent/clean
rm -f $(1)$(MODULE_FILES_DIR)$(MODULE_FILE_1)
rm -f $(1)$(MODULE_FILES_DIR)$(MODULE_FILE_2)
rm -f $(1)$(MODULE_FILES_DIR)$(MODULE_FILE_3)
rm -f $(1)$(RUN_DIR)$(RUN_DEST_FILE)
endef

$(eval $(call BuildPackage,owrt-snmp-agent))
