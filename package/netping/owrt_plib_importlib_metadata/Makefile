include $(TOPDIR)/rules.mk

PKG_NAME:="owrt_plib_importlib_metadata"
PKG_VERSION:=4.11.1
PKG_REV:=2dceff16f3fd23c0395cc16c3793e70972ce01bd
PKG_RELEASE:=2

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt_plib_importlib_metadata-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Netping/OWRT-PLIB-importlib-metadata.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt_plib_importlib_metadata
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=Python importlib-metadata 4.11.1-1 library
  URL:=https://github.com/Netping/OWRT-PLIB-importlib-metadata
  MAINTAINER:=Leonid Khlebushchev <info@netping.ru>
endef

define Package/owrt_plib_importlib_metadata/description
 Python importlib-metadata 4.11.1-1 library
endef

define Package/owrt_plib_importlib_metadata/install
	mkdir -p $(1)/usr/lib/python3.7/site-packages/importlib_metadata
	mkdir -p $(1)/usr/lib/python3.7/site-packages/importlib_metadata-4.11.1.dist-info
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/importlib_metadata
	cp -r $(PKG_BUILD_DIR)/importlib_metadata/* $(1)/usr/lib/python3.7/site-packages/importlib_metadata/
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/importlib_metadata-4.11.1.dist-info
	cp -r  $(PKG_BUILD_DIR)/importlib_metadata-4.11.1.dist-info/* $(1)/usr/lib/python3.7/site-packages/importlib_metadata-4.11.1.dist-info/
endef

$(eval $(call BuildPackage,owrt_plib_importlib_metadata))
