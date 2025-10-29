# Copyright (C) 2021-2022 NetPing

include $(TOPDIR)/rules.mk

PKG_NAME:=dkso-708
PKG_VERSION:=1.6
PKG_MAINTAINER:=Mikhail Sadikov <info@netping.ru>
PKG_RELEASE:=8

PKG_BUILD_DIR:=$(BUILD_DIR)/dkso-708-$(PKG_VERSION)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/dkso-708
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=Identification package for the image firmware version and hardware platform
endef

define Package/dkso-708/description
 Identification package for the image firmware version and hardware platform
endef

define Build/Prepare
	$(CP) opkg-keys/18e86236d041de40 $(PKG_BUILD_DIR)/
	$(CP) opkg-keys/Makefile $(PKG_BUILD_DIR)/
	$(CP) customfeeds.conf $(PKG_BUILD_DIR)/
	$(CP) openwrt_version $(PKG_BUILD_DIR)/
	sed -i 's/PKG_VERSION/$(PKG_VERSION).$(PKG_RELEASE)/' $(PKG_BUILD_DIR)/openwrt_version 
endef

Build/Compile=

define Package/dkso-708/install
	$(INSTALL_DIR) $(1)/etc/
	cp $(PKG_BUILD_DIR)/openwrt_version $(1)/etc/
	$(INSTALL_DIR) $(1)/etc/opkg/keys/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/18e86236d041de40 $(1)/etc/opkg/keys/
	$(INSTALL_DIR) $(1)/etc/opkg/
	cp $(PKG_BUILD_DIR)/customfeeds.conf $(1)/etc/opkg/
endef

$(eval $(call BuildPackage,dkso-708))
