include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-web-netping-schema"
PKG_VERSION=0.2
PKG_REV:=715374fc79ae265de64ed0510803f9bf5930a23e
PKG_RELEASE:=57

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-web-netping-schema-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-WEB-netping-schema.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-web-netping-schema
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=web interface customization module
  URL:=https://github.com/Netping/OWRT-WEB-netping-schema
  MAINTAINER:=Alexey Lozhanin <info@netping.ru>
  DEPENDS:=
endef

define Package/owrt-web-netping-schema/description
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
I18N_SOURCE_FILES=/i18n/*.lmo
I18N_DIR=/usr/lib/lua/luci/i18n/

define Package/owrt-web-netping-schema/install
	$(INSTALL_DIR) $(1)$(ETC_DIR)
#	$(INSTALL_BIN) $(PKG_BUILD_DIR)$(UCI_DEF_SOURCE_DIR)* $(1)$(ETC_DIR)	
	cp -r $(PKG_BUILD_DIR)$(UCI_DEF_SOURCE_DIR) $(1)$(ETC_DIR)	
	
	$(INSTALL_DIR) $(1)$(WWW_DIR)
#	$(INSTALL_BIN) $(PKG_BUILD_DIR)$(HTDOCS_SOURCE_DIR)luci-static/* $(1)$(WWW_DIR)
#	$(INSTALL_BIN) $(PKG_BUILD_DIR)$(HTDOCS_SOURCE_DIR)cgi-bin/* $(1)$(WWW_DIR)	
	cp -r $(PKG_BUILD_DIR)$(HTDOCS_SOURCE_DIR)luci-static $(1)$(WWW_DIR)
	cp -r $(PKG_BUILD_DIR)$(HTDOCS_SOURCE_DIR)cgi-bin $(1)$(WWW_DIR)	
	chmod +x $(1)$(WWW_DIR)cgi-bin/*.cgi	
	
	$(INSTALL_DIR) $(1)$(LUCI_DIR)
#	$(INSTALL_BIN) $(PKG_BUILD_DIR)$(LUCI_SOURCE_DIR)view/* $(1)$(LUCI_DIR)
	cp -r $(PKG_BUILD_DIR)/$(LUCI_SOURCE_DIR)view $(1)$(LUCI_DIR)
	
	$(INSTALL_DIR) $(1)$(I18N_DIR)
	$(CP) $(PKG_BUILD_DIR)$(I18N_SOURCE_FILES) $(1)$(I18N_DIR)

endef

$(eval $(call BuildPackage,owrt-web-netping-schema))
