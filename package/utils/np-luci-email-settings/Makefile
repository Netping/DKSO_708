include $(TOPDIR)/rules.mk

PKG_NAME:=np-luci-email-settings
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/np-luci-email-settings-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/Netping/DKSF_708_np_luci_email_settings/files/5220705/
PKG_HASH:=07eb71aa70c0bec171a1e64ad8448d36dd58f743b752d2d7b0838f38d5550189


PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/np-luci-email-settings
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=np-luci-email-settings
  URL:=https://github.com/Netping/DKST708_np_luci_email_settings
  MAINTAINER:=Alexander Timofeev <info@netping.ru>
endef

define Package/np-luci-email-settings/description
 NetPing luci email settings ...
endef

define Package/np-luci-email-settings/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/smtp_settings $(1)/etc/config/
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller/myapp
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/new_tab.lua $(1)/usr/lib/lua/luci/controller/myapp/
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi/myapp-mymodule
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/cbi_tab.lua $(1)/usr/lib/lua/luci/model/cbi/myapp-mymodule/
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/cbi
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/flag_encryption_enabled.htm $(1)/usr/lib/lua/luci/view/cbi/
endef

$(eval $(call BuildPackage,np-luci-email-settings))
