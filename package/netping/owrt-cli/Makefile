include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-cli"
PKG_VERSION=0.1
PKG_REV:=51d275d009457c141c6f1b0ed1fda97d57451e92
PKG_RELEASE:=17

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-cli-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT_CLI.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-cli
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=module for CLI interface
  URL:=https://github.com/Netping/OWRT_CLI
  MAINTAINER:=Leonid Khlebushchev <info@netping.ru>
  DEPENDS:= +owrt-plib-click +owrt-plib-ubus
endef

define Package/owrt-cli/description
 Module for CLI interface
endef

ETC_FILES_CLI:=cli.py
ETC_FILES_CONFPARSER:=confparser.py
ETC_FILES_NETPINGCLI:=netpingcli.py
ETC_FILES_DIR:=/etc/netping/cli/

CLI_LINK:=netping
BIN_DIR:=/usr/bin/

define Package/owrt-cli/install
	$(INSTALL_DIR) $(1)$(ETC_FILES_DIR)
	$(INSTALL_DIR) $(1)$(BIN_DIR)

	$(INSTALL_BIN) $(PKG_BUILD_DIR)/{$(ETC_FILES_CLI),$(ETC_FILES_CONFPARSER),$(ETC_FILES_NETPINGCLI)} $(1)$(ETC_FILES_DIR)
#	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(ETC_FILES_CONFPARSER) $(1)$(ETC_FILES_DIR)
#	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(ETC_FILES_NETPINGCLI) $(1)$(ETC_FILES_DIR)

	ln -sf $(1)$(ETC_FILES_DIR)$(ETC_FILES_CLI) $(1)$(BIN_DIR)$(CLI_LINK)
endef

define Package/owrt-cli/clean
	rm -rf $(1)$(ETC_FILES_DIR)
	rm -f $(1)$(BIN_DIR)$(CLI_LINK)
endef

$(eval $(call BuildPackage,owrt-cli))
