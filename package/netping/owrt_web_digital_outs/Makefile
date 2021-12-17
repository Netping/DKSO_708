include $(TOPDIR)/rules.mk

PKG_NAME:="owrt_web_digital_outs"
PKG_VERSION=1.2
PKG_REV:=156e6f4a755b66b7a3dda3394b01a2f29042fe00
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
  SUBMENU:=Utils and boot scripts
  TITLE:=web interface for binary outputs control module
  URL:=https://github.com/Netping/OWRT-WEB-Digital-outs
  MAINTAINER:=Leonid Khlebushchev <info@netping.ru>
  DEPENDS:=
endef

define Package/owrt_web_digital_outs/description
 Web interface for binary outputs control module
endef

CONTROLLER_SRC_DIR:=luasrc/controller
CONTROLLER_DIR:=/usr/lib/lua/luci/controller
MODEL_SRC_DIR:=luasrc/model
MODEL_DIR:=/usr/lib/lua/luci/model
VIEW_SRC_DIR:=luasrc/view
VIEW_DIR:=/usr/lib/lua/luci/view
RESOURCES_SRC_DIR:=luci-static/resources
RESOURCES_DIR:=/www/luci-static/resources


define Package/owrt_web_digital_outs/install
	mkdir -p $(1)$(CONTROLLER_DIR)
	cp -r $(PKG_BUILD_DIR)/$(CONTROLLER_SRC_DIR)/* $(1)$(CONTROLLER_DIR)
	mkdir -p $(1)$(MODEL_DIR)
	cp -r $(PKG_BUILD_DIR)/$(MODEL_SRC_DIR)/* $(1)$(MODEL_DIR)
	mkdir -p $(1)$(VIEW_DIR)
	cp -r $(PKG_BUILD_DIR)/$(VIEW_SRC_DIR)/* $(1)$(VIEW_DIR)
	mkdir -p $(1)$(RESOURCES_DIR)
	cp -r $(PKG_BUILD_DIR)/$(RESOURCES_SRC_DIR)/* $(1)$(RESOURCES_DIR)
$(eval $(call BuildPackage,owrt_web_digital_outs))
