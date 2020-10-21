include $(TOPDIR)/rules.mk

PKG_NAME:=np-version
PKG_VERSION:=1.2.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/np-version-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/Netping/DKSF708_netping_version/files/5418343/
PKG_HASH:=d0b322fc68fc9021cd0ecafdbb31f269a70c069c238105d75b5b3b65d3d69a9b


PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/np-version
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Utils and boot scripts
  TITLE:=helper script for working with netping-settings file
  URL:=https://github.com/Netping/DKST708_netping_version
  MAINTAINER:=Mikhail Sadikov <info@netping.ru>
endef

define Package/np-version/description
 NetPing-version - helper script for working with netping-settings file
endef

define Package/np-version/install
	echo $(shell date +"%Y%m%d%H%M%S") > $(PKG_BUILD_DIR)/build_ver
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/np_version.sh $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build_ver $(1)/etc/
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/netping-settings $(1)/etc/config/
endef

$(eval $(call BuildPackage,np-version))
