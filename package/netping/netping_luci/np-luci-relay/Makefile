include $(TOPDIR)/rules.mk

PKG_NAME:=np-luci-relay
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/np-luci-relay-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/Netping/netping_luci_relay/files/5461114/
PKG_HASH:=32ac448af29ed9a172c363d69782e20efefa66680d0b92a5b9e15f2b796ff34c


PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/np-luci-relay
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=NetPing LuCI
  TITLE:=relay manager
  URL:=https://github.com/Netping/netping_luci_relay
  MAINTAINER:=Anton Gavrilyuk <info@netping.ru>
endef

define Package/np-luci-relay/description
 NetPing relay manager
endef

define Package/np-luci-relay/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/settings $(1)/etc/config/
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller/netping_luci_relay
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/index.lua $(1)/usr/lib/lua/luci/controller/netping_luci_relay/
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi/netping_luci_relay
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/relay.lua $(1)/usr/lib/lua/luci/model/cbi/netping_luci_relay/
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/netping_luci_relay
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/css.htm $(1)/usr/lib/lua/luci/view/netping_luci_relay/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/js.htm $(1)/usr/lib/lua/luci/view/netping_luci_relay/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/table.htm $(1)/usr/lib/lua/luci/view/netping_luci_relay/
endef

$(eval $(call BuildPackage,np-luci-relay))
