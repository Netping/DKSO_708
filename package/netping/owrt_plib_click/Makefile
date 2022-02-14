include $(TOPDIR)/rules.mk

PKG_NAME:="owrt_plib_click"
PKG_VERSION:=8.0.3
PKG_REV:=30a7b332a86140060f509ea22ba103d5d28dea34
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt_plib_click-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Netping/OWRT-PLIB-click.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz


PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt_plib_click
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=Composable command line interface toolkit
  URL:=https://github.com/Netping/OWRT-PLIB-click
  MAINTAINER:=Michael Sadikov <info@netping.ru>
endef

define Package/owrt_plib_click/description
 Composable command line interface toolkit
endef

define Package/owrt_plib_click/install
	mkdir -p $(1)/usr/lib/python3.7/site-packages/click
	mkdir -p $(1)/usr/lib/python3.7/site-packages/click-8.0.3.dist-info
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/click
	cp -r $(PKG_BUILD_DIR)/click/* $(1)/usr/lib/python3.7/site-packages/click
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/click-8.0.3.dist-info
	cp -r  $(PKG_BUILD_DIR)/click-8.0.3.dist-info/* $(1)/usr/lib/python3.7/site-packages/click-8.0.3.dist-info
endef

$(eval $(call BuildPackage,owrt_plib_click))
