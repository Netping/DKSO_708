include $(TOPDIR)/rules.mk

PKG_NAME:="owrt_pingers"
PKG_VERSION=0.1
PKG_REV:=093a1b2350abb85338bac95f6ea442fc4662c5d5
PKG_RELEASE:=1

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

MODULE_FILES:=pingers.py
MODULE_FILES_DIR:=/etc/netping_pingers/

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
