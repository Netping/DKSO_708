include $(TOPDIR)/rules.mk

PKG_NAME:="owrt_snmp_protocol"
PKG_VERSION=1.2
PKG_REV:=627d77973f382d83d43615eae785e96bf7b91609
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt_snmp_protocol-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Netping/OWRT_SNMP_Protocol.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt_snmp_protocol
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=SNMP protocol support module
  URL:=https://github.com/Netping/OWRT_SNMP_Protocol
  MAINTAINER:=Aleksandr Shenshin <info@netping.ru>
  DEPENDS:=
endef

define Package/owrt_snmp_protocol/description
 SNMP protocol support module
endef

MODULE_FILES:=owrt_snmp_protocol.py
MODULE_FILES_DIR:=/usr/lib/python3.7/site-packages/

define Package/owrt_snmp_protocol/install
	mkdir -p $(1)$(MODULE_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(MODULE_FILES) $(1)$(MODULE_FILES_DIR)
endef

$(eval $(call BuildPackage,owrt_snmp_protocol))
