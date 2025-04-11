include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-web-digital-inputs"
PKG_VERSION=0.2
PKG_REV:=d8298ba9db750bbcb3cef10fbaf56e31a6396c8f
PKG_RELEASE:=13

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-web-digital-inputs-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-WEB-digital-inputs.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-web-digital-inputs
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=WEB-APP
  TITLE:=web interface for owrt_digital_inputs module
  URL:=https://github.com/Netping/OWRT-WEB-digital-inputs
  MAINTAINER:=Alexander N <info@netping.ru>
  DEPENDS:=+owrt-digital-inputs +luci-base +luci-compat
endef

define Package/owrt-web-digital-inputs/description
 Web interface for owrt-digital-inputs module
endef

MODULE_NAME:=owrt_web_digital_inputs
MODULE_FILES_DIR:=/usr/lib/lua/luci/
ACL_FILES_DIR:=/usr/share/rpcd/acl.d/
STATIC_FILES_DIR:=/www/luci-static/resources/view/

define Package/owrt-web-digital-inputs/install
	$(INSTALL_DIR) $(1)$(MODULE_FILES_DIR)
	$(CP) $(PKG_BUILD_DIR)/luasrc/* $(1)$(MODULE_FILES_DIR)
	
	$(INSTALL_DIR) $(1)$(ACL_FILES_DIR)
	$(CP) $(PKG_BUILD_DIR)/root/usr/share/rpcd/acl.d/* $(1)$(ACL_FILES_DIR)	
	
	$(INSTALL_DIR) $(1)$(STATIC_FILES_DIR)
	$(CP) $(PKG_BUILD_DIR)/htdocs/luci-static/resources/view/* $(1)$(STATIC_FILES_DIR)
	
endef

define Package/owrt-web-digital-inputs/clean
	rm $(1)$(MODULE_FILES_DIR)controller/$(MODULE_NAME).lua
	rm $(1)$(MODULE_FILES_DIR)i18n/$(MODULE_NAME).*.lmo
	rm $(1)$(ACL_FILES_DIR)$(MODULE_NAME).json
	rm -r $(1)$(STATIC_FILES_DIR)$(MODULE_NAME)
endef


$(eval $(call BuildPackage,owrt-web-digital-inputs))
