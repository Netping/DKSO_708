include $(TOPDIR)/rules.mk

PKG_NAME:="owrt_plib_zipp"
PKG_VERSION:=3.7.0-1
PKG_REV:=2198d161dcd250eeb7555df9e92faf7f3cf6e96c
PKG_RELEASE:=2

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt_plib_zipp-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Netping/OWRT-PLIB-zipp.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt_plib_zipp
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=Python zipp 3.7.0-1 library
  URL:=https://github.com/Netping/OWRT-PLIB-zipp
  MAINTAINER:=Leonid Khlebushchev <info@netping.ru>
endef

define Package/owrt_plib_zipp/description
 Python zipp 3.7.0-1 library
endef

define Package/owrt_plib_zipp/install
	mkdir -p $(1)/usr/lib/python3.7/site-packages
	mkdir -p $(1)/usr/lib/python3.7/site-packages/zipp-3.7.0.dist-info
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages
	cp -r $(PKG_BUILD_DIR)/*.py $(1)/usr/lib/python3.7/site-packages/
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/zipp-3.7.0.dist-info
	cp -r  $(PKG_BUILD_DIR)/zipp-3.7.0.dist-info/* $(1)/usr/lib/python3.7/site-packages/zipp-3.7.0.dist-info/
endef

$(eval $(call BuildPackage,owrt_plib_zipp))
