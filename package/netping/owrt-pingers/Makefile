include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-pingers"
PKG_VERSION=0.1
PKG_REV:=57777dd95ed33da509aa8da2ee193b63998f9c01
PKG_RELEASE:=10

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-pingers-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-pingers.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-pingers
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=external resource polling module
  URL:=https://github.com/Netping/OWRT-pingers
  MAINTAINER:=Leonid Khlebushchev <info@netping.ru>
  DEPENDS:= +owrt-log
endef

define Package/owrt-pingers/description
 External resource polling module
endef


MODULE_FILE1:=pingers.py
MODULE_FILE2:=Configname
MODULE_FILES_DIR:=/etc/netping/pingers/

CONF_FILE:=pingerconf
CONF_DIR:=/etc/config/

RUN_SOURCE_FILE:=owrt_pingers_autorun
RUN_DEST_FILE:=owrt_pingers
RUN_DIR:=/etc/init.d/


define Package/owrt-pingers/conffiles
	$(CONF_DIR)$(CONF_FILE)
endef

define Package/owrt-pingers/install
	$(INSTALL_DIR) $(1)$(CONF_DIR)
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/$(CONF_FILE) $(1)$(CONF_DIR)
	
	$(INSTALL_DIR) $(1)$(MODULE_FILES_DIR)/commands
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(MODULE_FILE1) $(1)$(MODULE_FILES_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(MODULE_FILE2) $(1)$(MODULE_FILES_DIR)
	
	$(INSTALL_DIR) $(1)$(RUN_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(RUN_SOURCE_FILE) $(1)$(RUN_DIR)$(RUN_DEST_FILE)

endef

define Package/owrt-pingers/clean
	rm -f $(1)$(CONF_DIR)$(CONF_FILE)
	rm -rf $(1)$(MODULE_FILES_DIR)
	rm -f $(1)$(RUN_DIR)$(RUN_DEST_FILE)
endef

$(eval $(call BuildPackage,owrt-pingers))
