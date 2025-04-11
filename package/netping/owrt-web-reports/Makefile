include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-web-reports"
PKG_VERSION=0.1
PKG_REV:=cb9d9a550ab243b844a30d1ad2c7f266ac264720
PKG_RELEASE:=8

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-web-reports-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-WEB-reports.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-web-reports
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=WEB-APP
  TITLE:=web interface for reports module
  URL:=https://github.com/Netping/OWRT-WEB-reports
  MAINTAINER:=Alexey Lozhanin <info@netping.ru>
  DEPENDS:= +owrt-reports +luci-base +luci-compat
endef

define Package/owrt-web-reports/description
 Web interface for reports module
endef

MODULE_FILES:=luasrc/controller/owrt_web_reports/index.lua
MODULE_FILES_DIR:=/usr/lib/lua/luci/controller/owrt_web_reports/
VIEW_FILES:=luasrc/view/owrt_web_reports/reports.htm
VIEW_FILES_DIR:=/usr/lib/lua/luci/view/owrt_web_reports/
STATIC_FILES:=netping
STATIC_FILES_DIR:=/www/luci-static/netping/
I18N_FILES:=i18n
I18N_FILES_DIR:=/usr/lib/lua/luci/i18n/

define Package/owrt-web-reports/install
	$(INSTALL_DIR) $(1)$(MODULE_FILES_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(MODULE_FILES) $(1)$(MODULE_FILES_DIR)	
	
	$(INSTALL_DIR) $(1)$(VIEW_FILES_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(VIEW_FILES) $(1)$(VIEW_FILES_DIR)	
	
	$(INSTALL_DIR) $(1)$(STATIC_FILES_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(STATIC_FILES)/* $(1)$(STATIC_FILES_DIR)	
	
	
	$(INSTALL_DIR) $(1)$(I18N_FILES_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(I18N_FILES)/*.lmo $(1)$(I18N_FILES_DIR)
endef

define Package/owrt-web-reports/clean
	rm -r $(1)$(MODULE_FILES_DIR)
	rm -r $(1)$$(1)$(VIEW_FILES_DIR)
	rm -r $(1)$(STATIC_FILES_DIR)$(PKG_NAME)s.*
	rm -r $(1)$(I18N_FILES_DIR)$(PKG_NAME).*.lmo
endef

$(eval $(call BuildPackage,owrt-web-reports))
