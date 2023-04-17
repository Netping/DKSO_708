include $(TOPDIR)/rules.mk
PKG_NAME:=OWRT_gpio_protocol
PKG_VERSION=0.1
PKG_REV:=e23ba49ab4f18f3b86c74e8514e501569ed73cb6
PKG_RELEASE:=7

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Netping/OWRT-gpio-protocol.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt_gpio_protocol
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=internal GPIO communication module
  URL:=https://github.com/Netping/OWRT-gpio-protocol
  MAINTAINER:=Leonid Khlebushchev <info@netping.ru>
  DEPENDS:= +owrt_log
endef

define Package/owrt_gpio_protocol/description
 Internal GPIO communication module
endef

MODULE_FILES:=gpioproto.py
MODULE_FILES_DIR:=/usr/lib/python3.7/

CONF_FILE:=gpioconf
DIRECTCONF_FILE:=directionconf
CONF_DIR:=/etc/config/

ETC_FILES:=
ETC_FILES_DIR:=/etc/netping/gpio/

define Package/owrt_gpio_protocol/install
	mkdir -p $(1)$(CONF_DIR)
	mkdir -p $(1)$(MODULE_FILES_DIR)
	mkdir -p $(1)$(ETC_FILES_DIR)
	cp $(PKG_BUILD_DIR)/$(CONF_FILE) $(1)$(CONF_DIR)
	cp $(PKG_BUILD_DIR)/$(DIRECTCONF_FILE) $(1)$(CONF_DIR)
	cp $(PKG_BUILD_DIR)/$(MODULE_FILES) $(1)$(MODULE_FILES_DIR)
endef

define Package/owrt_gpio_protocol/clean
	rm -f $(1)$(CONF_DIR)$(CONF_FILE)
	rm -f $(1)$(CONF_DIR)$(DIRECTCONF_FILE)
	rm -rf $(1)$(MODULE_FILES_DIR)
	rm -rf $(1)$(ETC_FILES_DIR)
endef

$(eval $(call BuildPackage,owrt_gpio_protocol))
