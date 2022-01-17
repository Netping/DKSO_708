# Copyright (C) 2021 NetPing

include $(TOPDIR)/rules.mk

PKG_NAME:=dkso_708
PKG_VERSION:=708.1.2
PKG_MAINTAINER:=Mikhail Sadikov <info@netping.ru>
PKG_RELEASE:=4

PKG_BUILD_DIR:=$(BUILD_DIR)/dkso_708-$(PKG_VERSION)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/dkso_708
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Utils and boot scripts
  TITLE:=Identification package for the image firmware version and hardware platform
endef

define Package/dkso_708/description
 dkso_708 - identification package for the image firmware version and hardware platform
endef

define Build/Prepare
	$(CP) opkg-keys/18e86236d041de40 $(PKG_BUILD_DIR)/
	$(CP) opkg-keys/Makefile $(PKG_BUILD_DIR)/
	$(CP) customfeeds.conf $(PKG_BUILD_DIR)/
	$(CP) openwrt_version $(PKG_BUILD_DIR)/
endef

Build/Compile=

define Package/dkso_708/install
	$(INSTALL_DIR) $(1)/etc/
	cp $(PKG_BUILD_DIR)/openwrt_version $(1)/etc/
	$(INSTALL_DIR) $(1)/etc/opkg/keys/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/18e86236d041de40 $(1)/etc/opkg/keys/
	$(INSTALL_DIR) $(1)/etc/opkg/
	cp $(PKG_BUILD_DIR)/customfeeds.conf $(1)/etc/opkg/
endef

$(eval $(call BuildPackage,dkso_708))
