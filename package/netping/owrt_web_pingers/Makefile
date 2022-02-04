include $(TOPDIR)/rules.mk

PKG_NAME:="owrt_web_pingers"
PKG_VERSION=0.1
PKG_REV:=bbe0c339d299ab702c1436ad714063d2e276a006
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt_web_pingers-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Netping/OWRT-WEB-pingers.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt_web_pingers
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Utils and boot scripts
  TITLE:=web interface for owrt_pingers module
  URL:=https://github.com/Netping/OWRT-WEB-pingers
  MAINTAINER:=Alexey Lozhanin <info@netping.ru>
  DEPENDS:=
endef

define Package/owrt_web_pingers/description
 Web interface for owrt_pingers module
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

define Package/owrt_web_pingers/install
	mkdir -p $(1)$(LUCI_CONTROLLER_DIR)
	mkdir -p $(1)$(LUCI_VIEW_DIR)
	mkdir -p $(1)$(WWW_STATUS_DIR)
	mkdir -p $(1)$(WWW_SCC_JS)
	cp -r $(PKG_BUILD_DIR)$(LUCI_SOURCE_DIR)index.lua $(1)$(LUCI_CONTROLLER_DIR)
	cp -r $(PKG_BUILD_DIR)$(LUCI_SOURCE_DIR)*.htm $(1)$(LUCI_VIEW_DIR)
	cp -r $(PKG_BUILD_DIR)$(WWW_SOURCE_DIR)*.cgi $(1)$(WWW_STATUS_DIR)
	cp -r $(PKG_BUILD_DIR)$(WWW_SOURCE_DIR)owrt_web_pingers.* $(1)$(WWW_SCC_JS)
endef

define Package/owrt_web_pingers/remove
	rm -f $(1)$(WWW_STATUS_DIR)pinger_status.cgi
	rm -f $(1)$(WWW_STATUS_DIR)rule_status.cgi
	rm -f $(1)$(WWW_SCC_JS)owrt_web_pingers.*
	rm -rf $(1)$(LUCI_CONTROLLER_DIR)
	rm -rf $(1)$(LUCI_VIEW_DIR)
endef

$(eval $(call BuildPackage,owrt_web_pingers))
