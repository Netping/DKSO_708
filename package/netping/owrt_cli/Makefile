include $(TOPDIR)/rules.mk

PKG_NAME:="owrt_cli"
PKG_VERSION=0.1
PKG_REV:=93666711857f40d2a7d81bfcc9b64ac58a7e1d68
PKG_RELEASE:=16

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt_cli-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Netping/OWRT_CLI.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt_cli
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=module for system information display
  URL:=https://github.com/Netping/OWRT_CLI
  MAINTAINER:=Leonid Khlebushchev <info@netping.ru>
  DEPENDS:= +owrt_plib_click +owrt-plib-ubus
endef

define Package/owrt_cli/description
 Module for system information display
endef

ETC_FILES_CLI:=cli.py
ETC_FILES_CONFPARSER:=confparser.py
ETC_FILES_NETPINGCLI:=netpingcli.py
ETC_FILES_DIR:=/etc/netping_cli/

CLI_LINK:=netping
BIN_DIR:=/usr/bin/

define Package/owrt_cli/install
	mkdir -p $(1)$(ETC_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(ETC_FILES_CLI) $(1)$(ETC_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(ETC_FILES_CONFPARSER) $(1)$(ETC_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(ETC_FILES_NETPINGCLI) $(1)$(ETC_FILES_DIR)
	mkdir -p $(1)$(BIN_DIR)
	ln -s $(1)$(ETC_FILES_DIR)$(ETC_FILES_CLI) $(1)$(BIN_DIR)$(CLI_LINK)
endef

$(eval $(call BuildPackage,owrt_cli))
