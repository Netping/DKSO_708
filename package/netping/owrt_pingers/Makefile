include $(TOPDIR)/rules.mk

PKG_NAME:="owrt_pingers"
PKG_VERSION=0.1
PKG_REV:=d33af78a70d7d929c4f6adc94a8f1ac6035f6735
PKG_RELEASE:=8

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt_pingers-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Netping/OWRT-pingers.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt_pingers
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=external resource polling module
  URL:=https://github.com/Netping/OWRT-pingers
  MAINTAINER:=Leonid Khlebushchev <info@netping.ru>
  DEPENDS:= +owrt_log
endef

define Package/owrt_pingers/description
 External resource polling module
endef

MODULE_FILES_DIR:=/usr/lib/python3.7/site-packages/

MODULE_FILE1:=pingers.py
MODULE_FILE2:=Configname
MODULE_FILES_DIR:=/etc/netping/pingers/

CONF_FILE:=pingerconf
CONF_DIR:=/etc/config/

RUN_SOURCE_FILE:=owrt_pingers_autorun
RUN_DEST_FILE:=owrt_pingers
RC_RUN_DEST_FILE:=S90OWRT-Pingers
RUN_DIR:=/etc/init.d/
RC_RUN_DIR:=/etc/rc.d/

define Package/owrt_pingers/install
	mkdir -p $(1)$(CONF_DIR)
	cp $(PKG_BUILD_DIR)/$(CONF_FILE) $(1)$(CONF_DIR)
	mkdir -p $(1)$(MODULE_FILES_DIR)
	mkdir -p $(1)$(MODULE_FILES_DIR)/commands
	cp $(PKG_BUILD_DIR)/$(MODULE_FILE1) $(1)$(MODULE_FILES_DIR)
	cp $(PKG_BUILD_DIR)/$(MODULE_FILE2) $(1)$(MODULE_FILES_DIR)
	mkdir -p $(1)$(RUN_DIR)
	mkdir -p $(1)$(RC_RUN_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(RUN_SOURCE_FILE) $(1)$(RUN_DIR)$(RUN_DEST_FILE)
###	ln -s $(1)$(RUN_DIR)$(RUN_DEST_FILE) $(1)$(RC_RUN_DIR)$(RC_RUN_DEST_FILE)
endef

define Package/owrt_pingers/clean
	rm -f $(1)$(CONF_DIR)$(CONF_FILE)
	rm -rf $(1)$(MODULE_FILES_DIR)
###	rm -f $(1)$(RC_RUN_DIR)$(RC_RUN_DEST_FILE)
	rm -f $(1)$(RUN_DIR)$(RUN_DEST_FILE)
endef

$(eval $(call BuildPackage,owrt_pingers))
