include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-input-validate"
PKG_VERSION:=0.1
PKG_REV:=61db2089d315503cee41fb9ebdd81276b0a9f52c
PKG_RELEASE:=8

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-input-validate-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-input-validate.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-input-validate
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=User input validator
  URL:=https://github.com/Netping/OWRT-input-validate
  MAINTAINER:=Netping <info@netping.ru>
  DEPENDS:=+ubus +libubus-lua +libubox-lua +lua
endef

define Package/owrt-input-validate/description
 Module for validating user input
endef

MODULE_NAME := owrt_input_validate


SRC_FILES_DIR := /root/usr/lib/lua
SRC_AUTORUN_DIR := /root/etc/init.d
SRC_BIN_DIR := /root/usr/bin

MODULE_FILES_DIR := /usr/lib/lua
MODULE_INIT_DIR := /etc/init.d
MODULE_BIN_DIR := /usr/libexec



define Package/owrt-input-validate/install

	$(INSTALL_DIR) $(1)$(MODULE_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)$(SRC_FILES_DIR)/$(MODULE_NAME)/* $(1)$(MODULE_FILES_DIR)

	$(INSTALL_DIR) $(1)$(MODULE_BIN_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)$(SRC_BIN_DIR)/* $(1)$(MODULE_BIN_DIR)
	
	$(INSTALL_DIR) $(1)$(MODULE_INIT_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)$(SRC_AUTORUN_DIR)/* $(1)$(RUN_DIR)$(MODULE_INIT_DIR)

endef

define Package/owrt-input-validate/clean
	rm -rf $(1)$(MODULE_FILES_DIR)/$(MODULE_NAME)
	rm -f $(1)$(MODULE_INIT_DIR)/$(MODULE_NAME)
	rm -f $(1)$(MODULE_BIN_DIR)/$(MODULE_NAME)

endef

$(eval $(call BuildPackage,owrt-input-validate))
