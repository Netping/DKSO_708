include $(TOPDIR)/rules.mk

PKG_NAME:="owrt_digital_inputs"
PKG_VERSION=0.1
PKG_REV:=a0c3d5d6e026364733273460842753e80cdc65f1
PKG_RELEASE:=24

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt_digital_inputs-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Netping/OWRT-digital-inputs.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt_digital_inputs
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=input lines module
  URL:=https://github.com/Netping/OWRT-digital-inputs
  MAINTAINER:=Leonid Khlebushchev <info@netping.ru>
  DEPENDS:= +owrt_log +owrt_snmp_protocol
endef

define Package/owrt_digital_inputs/description
 Input lines module
endef

MODULE_FILES_DIR:=/usr/lib/python3.7/site-packages/

ETC_FILE1:=Configname
ETC_FILE2:= owrt_digital_inputs.py
ETC_FILES_DIR:=/etc/netping_digital_inputs/

CONF_FILE:=diginsensorconf
CONF_DIR:=/etc/config/

RUN_SOURCE_FILE:=owrt_digital_inputs_autorun
RUN_DEST_FILE:=owrt_digital_inputs
RC_RUN_DEST_FILE:=S90OWRT-Digital-inputs
RUN_DIR:=/etc/init.d/
RC_RUN_DIR:=/etc/rc.d/

define Package/owrt_digital_inputs/install
	mkdir -p $(1)$(CONF_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(CONF_FILE) $(1)$(CONF_DIR)
	mkdir -p $(1)$(ETC_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(ETC_FILE1) $(1)$(ETC_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(ETC_FILE2) $(1)$(ETC_FILES_DIR)
	mkdir -p $(1)$(RUN_DIR)
	mkdir -p $(1)$(RC_RUN_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(RUN_SOURCE_FILE) $(1)$(RUN_DIR)$(RUN_DEST_FILE)
###	ln -s $(1)$(RUN_DIR)$(RUN_DEST_FILE) $(1)$(RC_RUN_DIR)$(RC_RUN_DEST_FILE)
endef

define Package/owrt_digital_inputs/clean
	rm -f $(1)$(CONF_DIR)$(CONF_FILE)
	rm -rf $(1)$(ETC_FILES_DIR)
###	rm -f $(1)$(RC_RUN_DIR)$(RC_RUN_DEST_FILE)
	rm -f $(1)$(RUN_DIR)$(RUN_DEST_FILE)
endef

$(eval $(call BuildPackage,owrt_digital_inputs))
