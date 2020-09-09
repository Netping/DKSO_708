include $(TOPDIR)/rules.mk

PKG_NAME:=np-init
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/np-init-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/Netping/DKST708_np_init/files/5197920/
PKG_HASH:=943e8ff62dfd13492be29afc1276370150b71066d25f4754e4114301a24a9dff


PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/np-init
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=np_init.sh is a simple boot time initialization script for user partition
  URL:=https://github.com/Netping/DKST708_np_init
  MAINTAINER:=Michael Sadikov <miksadikov@gmail.com>
endef

define Package/np-init/description
 Simple boot time initialization script for user partition
endef

define Package/np-init/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/np_init.sh $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/np_init $(1)/etc/init.d/
endef

$(eval $(call BuildPackage,np-init))
