include $(TOPDIR)/rules.mk

PKG_NAME:=np-version
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/np-version-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/Netping/DKSF708_netping_version/files/5234668/
PKG_HASH:=3164aac50774d8c7ef2d4910746720d69e1bcbb1cf880d9274be80967e11adc8


PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/np-version
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Utils and boot scripts
  TITLE:=display device name, firmware version and build time
  URL:=https://github.com/Netping/DKST708_np_version
  MAINTAINER:=Mikhail Sadikov <info@netping.ru>
endef

define Package/np-version/description
 NetPing-version - a simple package to display OpenWrt current image version 
endef

define Package/np-version/install
	echo $(shell date +"%Y%m%d%H%M%S") > $(PKG_BUILD_DIR)/build_ver
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/np_version.sh $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build_ver $(1)/etc/
endef

$(eval $(call BuildPackage,np-version))
