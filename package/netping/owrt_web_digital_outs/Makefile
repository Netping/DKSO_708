include $(TOPDIR)/rules.mk

PKG_NAME:="owrt_web_digital_outs"
PKG_VERSION=0.1
PKG_REV:=155de2fd2dadbc6bd5f8d320275fbd9e21130aaa
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt_web_digital_outs-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Netping/OWRT-WEB-Digital-outs.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt_web_digital_outs
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=web interface for binary outputs control module
  URL:=https://github.com/Netping/OWRT-WEB-Digital-outs
  MAINTAINER:=Leonid Khlebushchev <info@netping.ru>
  DEPENDS:=
endef

define Package/owrt_web_digital_outs/description
 Web interface for binary outputs control module
endef

MODULE_FILES_DIR:=/usr/lib/lua/luci
STATIC_FILES:=htdocs/luci-static/resources/*
STATIC_FILES_DIR:=/www/luci-static/resources/


define Package/owrt_web_digital_outs/install
	mkdir -p $(1)$(MODULE_FILES_DIR)$(STATIC_FILES_DIR)
	cp -r $(PKG_BUILD_DIR)/luasrc/* $(1)$(MODULE_FILES_DIR)
	cp -r $(PKG_BUILD_DIR)/$(STATIC_FILES) $(1)$(MODULE_FILES_DIR)$(STATIC_FILES_DIR)
endef

$(eval $(call BuildPackage,owrt_web_digital_outs))
