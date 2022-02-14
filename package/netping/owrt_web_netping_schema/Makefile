include $(TOPDIR)/rules.mk

PKG_NAME:="owrt_web_netping_schema"
PKG_VERSION=0.1
PKG_REV:=c63ba7fad8a09cb5a9dc4ca2b1439c799284a0db
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt_web_netping_schema-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Netping/OWRT-WEB-netping-schema.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt_web_netping_schema
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=web interface customization module
  URL:=https://github.com/Netping/OWRT-WEB-netping-schema
  MAINTAINER:=Alexey Lozhanin <info@netping.ru>
  DEPENDS:=
endef

define Package/owrt_web_netping_schema/description
 Web interface customization module
endef

CONF_FILE:=
CONF_DIR:=/etc/config/
MODULE_NAME:=owrt_web_netping_schema
UCI_DEF_SOURCE_DIR:=/root/etc/uci-defaults/
LUCI_SOURCE_DIR:=/luasrc/
LUCI_DIR:=/usr/lib/lua/luci/
WWW_DIR:=/www/
ETC_DIR:=/etc/
HTDOCS_SOURCE_DIR:=/htdocs/

define Package/owrt_web_netping_schema/install
	mkdir -p $(1)$(ETC_DIR)
	mkdir -p $(1)$(WWW_DIR)
	mkdir -p $(1)$(LUCI_DIR)
	cp -r $(PKG_BUILD_DIR)/$(UCI_DEF_SOURCE_DIR) $(1)$(ETC_DIR)
	cp -r $(PKG_BUILD_DIR)/$(HTDOCS_SOURCE_DIR)luci-static $(1)$(WWW_DIR)
	cp -r $(PKG_BUILD_DIR)/$(HTDOCS_SOURCE_DIR)cgi-bin $(1)$(WWW_DIR)
	cp -r $(PKG_BUILD_DIR)/$(LUCI_SOURCE_DIR)view $(1)$(LUCI_DIR)
endef

$(eval $(call BuildPackage,owrt_web_netping_schema))
