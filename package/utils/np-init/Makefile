include $(TOPDIR)/rules.mk

PKG_NAME:=np-init
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/np-init-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
#PKG_SOURCE:=np_init.sh
#PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Netping/DKST708_np_init/files/5184666/
PKG_HASH:=710b7e49ceea373f9e34b7f238346692f8e8ae68f7bccc7ac07edf21a66b6d67


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
endef

$(eval $(call BuildPackage,np-init))
