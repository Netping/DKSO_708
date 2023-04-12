CONF_FILE=gpioconf
DIRECTCONF_FILE=directionconf
CONF_DIR=/etc/config/


ETC_FILES=
ETC_FILES_DIR=/etc/netping/gpio/

INSTALL_DIR=

TESTS_SRC_DIR=Tests

install:
ifneq ($(INSTALL_DIR),)
	mkdir -p $(INSTALL_DIR)$(CONF_DIR)
	mkdir -p $(INSTALL_DIR)$(MODULE_FILES_DIR)
endif
	mkdir -p $(INSTALL_DIR)$(ETC_FILES_DIR)
	cp $(CONF_FILE) $(INSTALL_DIR)/$(CONF_DIR)
	cp $(DIRECTCONF_FILE) $(INSTALL_DIR)/$(CONF_DIR)
	for f in $(MODULE_FILES); do cp $${f} $(INSTALL_DIR)/$(MODULE_FILES_DIR); done
	cp -r $(TESTS_SRC_DIR) $(INSTALL_DIR)$(ETC_FILES_DIR)

clean:
ifeq ($(INSTALL_DIR),)
	rm -f $(CONF_DIR)$(CONF_FILE)
	rm -f $(CONF_DIR)$(DIRECTCONF_FILE)
	for f in $(MODULE_FILES); do rm -f $(MODULE_FILES_DIR)$${f}; done
	rm -rf $(ETC_FILES_DIR)
else
	rm -rf $(INSTALL_DIR)
endif
--------------------------------------------------------------------------

include $(TOPDIR)/rules.mk
PKG_NAME:="OWRT_gpio_protocol"
PKG_VERSION=0.1
PKG_REV:=e23ba49ab4f18f3b86c74e8514e501569ed73cb6
PKG_RELEASE:=7

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt_gpio_protocol-$(PKG_VERSION)
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

define Package/owrt_pingers/description
 Internal GPIO communication module
endef

MODULE_FILES:=gpioproto.py
MODULE_FILES_DIR:=/usr/lib/python3.7/

CONF_FILE:=pingerconf
CONF_DIR:=/etc/config/

define Package/owrt_pingers/install
	mkdir -p $(1)$(CONF_DIR)
	cp $(PKG_BUILD_DIR)/$(CONF_FILE) $(1)$(CONF_DIR)
	mkdir -p $(1)$(MODULE_FILES_DIR)
	cp $(PKG_BUILD_DIR)/$(MODULE_FILES) $(1)$(MODULE_FILES_DIR)
endef

define Package/owrt_pingers/clean
	rm -f $(1)$(CONF_DIR)$(CONF_FILE)
	rm -rf $(1)$(MODULE_FILES_DIR)
endef

$(eval $(call BuildPackage,owrt_pingers))
