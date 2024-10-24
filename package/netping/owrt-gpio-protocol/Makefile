include $(TOPDIR)/rules.mk

PKG_NAME:=owrt-gpio-protocol
PKG_VERSION=1.0
PKG_REV:=2a889e7c7ed3b63453ec8f29abccb0e1a0422155
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-gpio-protocol.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-gpio-protocol
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=internal GPIO communication module
  URL:=https://github.com/Netping/OWRT-gpio-protocol
  MAINTAINER:=Egor Zyryanov <info@netping.ru>
  DEPENDS:=+owrt-log +owrt-plib-pyinotify +libgpiod +python3-gpiod
endef

define Package/owrt-gpio-protocol/description
 Internal GPIO communication module
endef

MODULE_FILES:=gpioproto.py
MODULE_FILES_DIR:=/usr/lib/python3.7/

CONF_FILE:=gpioconf
DIRECTCONF_FILE:=directionconf
CONF_DIR:=/etc/config/
RUN_SOURCE_FILE:=owrt_gpio-protocol_autorun
RUN_DEST_FILE:=owrt_gpio_protocol
RUN_DIR:=/etc/init.d/


define Package/owrt-gpio-protocol/conffiles
	$(CONF_DIR)$(CONF_FILE)
	$(CONF_DIR)$(DIRECTCONF_FILE)
endef

define Package/owrt-gpio-protocol/install
	$(INSTALL_DIR) $(1)$(CONF_DIR)
	$(INSTALL_DIR) $(1)$(MODULE_FILES_DIR)
	$(INSTALL_DIR) $(1)$(RUN_DIR)

	$(INSTALL_CONF) $(PKG_BUILD_DIR)/{$(CONF_FILE),$(DIRECTCONF_FILE)} $(1)$(CONF_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(MODULE_FILES) $(1)$(MODULE_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(RUN_SOURCE_FILE) $(1)$(RUN_DIR)$(RUN_DEST_FILE)
endef

define Package/owrt-gpio-protocol/clean
	rm -f $(1)$(CONF_DIR)$(CONF_FILE)
	rm -f $(1)$(CONF_DIR)$(DIRECTCONF_FILE)
	rm -rf $(1)$(MODULE_FILES_DIR)
	rm -f $(1)$(RUN_DIR)$(RUN_DEST_FILE)
endef

$(eval $(call BuildPackage,owrt-gpio-protocol))
