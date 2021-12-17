include $(TOPDIR)/rules.mk

PKG_NAME:="owrt_web_netping_schema"
PKG_VERSION=1.2
PKG_REV:=0e55727c371b794ed343f876e3249bbf9f7c6ff9
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
  SUBMENU:=Utils and boot scripts
  TITLE:=Netping OpenWrt web interface customization
  URL:=https://github.com/Netping/OWRT-WEB-netping-schema
  MAINTAINER:=Alexey L <info@netping.ru>
  DEPENDS:=
endef

define Package/owrt_web_netping_schema/description
 Netping OpenWrt web interface customization
endef

CONTROLLER_SRC_DIR:=luasrc/controller
CONTROLLER_DIR:=/usr/lib/lua/luci/controller
MODEL_SRC_DIR:=luasrc/model
MODEL_DIR:=/usr/lib/lua/luci/model
VIEW_SRC_DIR:=luasrc/view
VIEW_DIR:=/usr/lib/lua/luci/view
RESOURCES_SRC_DIR:=luci-static/resources
RESOURCES_DIR:=/www/luci-static/resources


define Package/owrt_web_netping_schema/install
	mkdir -p $(1)$(CONTROLLER_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(CONTROLLER_SRC_DIR)/* $(1)$(CONTROLLER_DIR)
	mkdir -p $(1)$(MODEL_DIR)
        $(INSTALL_BIN) $(PKG_BUILD_DIR)/$(MODEL_SRC_DIR)/* $(1)$(MODEL_DIR)
	mkdir -p $(1)$(VIEW_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(VIEW_SRC_DIR)/* $(1)$(VIEW_DIR)
	mkdir -p $(1)$(VIEW_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(RESOURCES_SRC_DIR)/* $(1)$(RESOURCES_DIR)
endef

$(eval $(call BuildPackage,owrt_web_netping_schema))
