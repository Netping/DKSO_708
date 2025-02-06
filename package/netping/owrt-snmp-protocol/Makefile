include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-snmp-protocol"
PKG_VERSION=0.1
PKG_REV:=d706afdebf25ca83225a215c34d3dbd73fcf002a
PKG_RELEASE:=6

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-snmp-protocol-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-snmp-protocol.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-snmp-protocol
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=SNMP protocol support module
  URL:=https://github.com/Netping/OWRT_SNMP_Protocol
  MAINTAINER:=Aleksandr Shenshin <info@netping.ru>
  DEPENDS:=owrt-plib-puresnmp +owrt-log
endef

define Package/owrt-snmp-protocol/description
 SNMP protocol support module
endef

MODULE_FILES:=owrt_snmp_protocol.py
MODULE_FILES_DIR:=/usr/lib/python3.7/site-packages/

define Package/owrt-snmp-protocol/install
	$(INSTALL_DIR) $(1)$(MODULE_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(MODULE_FILES) $(1)$(MODULE_FILES_DIR)
endef

define Package/owrt-snmp-protocol/clean
	rm -f $(1)$(MODULE_FILES_DIR)$(MODULE_FILES)
endef

$(eval $(call BuildPackage,owrt-snmp-protocol))
