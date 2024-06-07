include $(TOPDIR)/rules.mk

PKG_NAME:=owrt-web-digital-outs
PKG_VERSION=0.2
PKG_REV:=22789440373e5bc62c31f227e9517d5aa9937144
PKG_RELEASE:=4

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-WEB-Digital-outs.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-web-digital-outs
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=web interface for binary outputs control module
  URL:=https://github.com/Netping/OWRT-WEB-Digital-outs
  MAINTAINER:=Aleksey Lozhanin <info@netping.ru>
  DEPENDS:= +owrt-digital-outs +luci-base +luci-compat
endef

define Package/owrt-web-digital-outs/description
 Web interface for binary outputs control module
endef

MODULE_NAME = owrt_web_digital_outs
MODULE_FILES = luasrc/*
MODULE_FILES_DIR = /usr/lib/lua/luci/
STATIC_FILES = netping/*
STATIC_FILES_DIR = /www/luci-static/netping/
I18N_FILES = i18n/*.lmo
I18N_FILES_DIR = /usr/lib/lua/luci/i18n/

define Package/owrt-web-digital-outs/install
	$(INSTALL_DIR) $(1)$(MODULE_FILES_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(MODULE_FILES) $(1)$(MODULE_FILES_DIR)
	
	$(INSTALL_DIR) $(1)$(STATIC_FILES_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(STATIC_FILES) $(1)$(STATIC_FILES_DIR)	
	
	$(INSTALL_DIR) $(1)$(I18N_FILES_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(I18N_FILES) $(1)$(I18N_FILES_DIR)
	
endef

define Package/owrt-web-digital-outs/clean
	rm -r $(1)$(MODULE_FILES_DIR)controller/$(MODULE_NAME)
	rm -r $(1)$(MODULE_FILES_DIR)view/$(MODULE_NAME)
	rm -r $(1)$(STATIC_FILES_DIR)$(MODULE_NAME).*
	rm -r $(1)$(I18N_FILES_DIR)$(MODULE_NAME)/*.lmo

endef

$(eval $(call BuildPackage,owrt-web-digital-outs))
