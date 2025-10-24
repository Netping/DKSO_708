include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-http-agent"
PKG_VERSION=0.1
PKG_REV:=a5f12298d278a9cfdd8ab4c0cc2d67aef2962273
PKG_RELEASE:=3

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-http-agent-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-http-agent.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-http-agent
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=HTTP agent module
  URL:=https://github.com/Netping/OWRT-http-agent
  MAINTAINER:=Netping <info@netping.ru>
  DEPENDS:=+owrt-plib-ubus
endef

define Package/owrt-http-agent/description
 Module for manage HTTP API connections
endef

CONF_FILE:=http-agent
CONF_DIR:=/etc/config/

MODULE_FILE_1:=http-agent.py
MODULE_FILE_2:=parser.py
MODULE_FILES_DIR:=/usr/lib/python3.7/


RUN_SOURCE_FILE:=owrt_http-agent_autorun
RUN_DEST_FILE:=owrt_http-agent
#RC_RUN_DEST_FILE:=S90OWRT-Notifications
RUN_DIR:=/etc/init.d/


define Build/Prepare
	$(Build/Prepare/Default)
	$(CP) $(CONF_FILE) $(PKG_BUILD_DIR)
endef

define Package/owrt-http-agent/conffiles
	$(CONF_DIR)$(CONF_FILE)
endef

define Package/owrt-http-agent/install
	$(INSTALL_DIR) $(1)$(MODULE_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/{$(MODULE_FILE_1),$(MODULE_FILE_2)} $(1)$(MODULE_FILES_DIR)

	$(INSTALL_DIR) $(1)$(CONF_DIR)
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/$(CONF_FILE) $(1)$(CONF_DIR)
	
	$(INSTALL_DIR) $(1)$(RUN_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(RUN_SOURCE_FILE) $(1)$(RUN_DIR)$(RUN_DEST_FILE)

endef

define Package/owrt-http-agent/clean
	rm -f $(1)$(CONF_DIR)$(CONF_FILE)
	rm -f $(1)$(MODULE_FILE_1)
	rm -f $(1)$(MODULE_FILE_2)
###	rm -f $(1)$(RC_RUN_DIR)$(RC_RUN_DEST_FILE)
	rm -f $(1)$(RUN_DIR)$(RUN_DEST_FILE)
endef

$(eval $(call BuildPackage,owrt-http-agent))
