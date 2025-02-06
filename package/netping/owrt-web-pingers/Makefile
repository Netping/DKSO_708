include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-web-pingers"
PKG_VERSION=0.1
PKG_REV:=ed4aedf77dbca589145b953ac3b77583c5d3619f
PKG_RELEASE:=43

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-web-pingers-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-WEB-pingers.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-web-pingers
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=WEB-APP
  TITLE:=web interface for owrt_pingers module
  URL:=https://github.com/Netping/OWRT-WEB-pingers
  MAINTAINER:=Alexey Lozhanin <info@netping.ru>
  DEPENDS:=+owrt-pingers +luci-base +luci-compat
endef

define Package/owrt-web-pingers/description
 Web interface for owrt-pingers module
endef

CONF_FILE:=pingerconf
CONF_DIR:=/etc/config/
MODULE_NAME:=owrt_web_pingers
LUCI_SOURCE_DIR:=/lucisrc/
WWW_SOURCE_DIR:=/www/
LUCI_CONTROLLER_DIR:=/usr/lib/lua/luci/controller/owrt_web_pingers/
LUCI_VIEW_DIR:=/usr/lib/lua/luci/view/owrt_web_pingers/
WWW_STATUS_DIR:=/www/cgi-bin/
WWW_SCC_JS:=/www/luci-static/netping/

define Package/owrt-web-pingers/install
	mkdir -p $(1)$(LUCI_CONTROLLER_DIR)
	mkdir -p $(1)$(LUCI_VIEW_DIR)
	mkdir -p $(1)$(WWW_STATUS_DIR)
	mkdir -p $(1)$(WWW_SCC_JS)
	cp -r $(PKG_BUILD_DIR)$(LUCI_SOURCE_DIR)index.lua $(1)$(LUCI_CONTROLLER_DIR)
	cp -r $(PKG_BUILD_DIR)$(LUCI_SOURCE_DIR)*.htm $(1)$(LUCI_VIEW_DIR)
	cp -r $(PKG_BUILD_DIR)$(WWW_SOURCE_DIR)*.cgi $(1)$(WWW_STATUS_DIR)
	cp -r $(PKG_BUILD_DIR)$(WWW_SOURCE_DIR)owrt_web_pingers.* $(1)$(WWW_SCC_JS)
	chmod +x $(1)$(WWW_STATUS_DIR)*.cgi
endef

define Package/owrt-web-pingers/remove
	rm -f $(1)$(WWW_STATUS_DIR)pinger_status.cgi
	rm -f $(1)$(WWW_STATUS_DIR)rule_status.cgi
	rm -f $(1)$(WWW_SCC_JS)owrt_web_pingers.*
	rm -rf $(1)$(LUCI_CONTROLLER_DIR)
	rm -rf $(1)$(LUCI_VIEW_DIR)
endef

$(eval $(call BuildPackage,owrt-web-pingers))
