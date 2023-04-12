include $(TOPDIR)/rules.mk

PKG_NAME:="owrt_web_email_settings"
PKG_VERSION=0.2
PKG_REV:=a8abb10b4febc0c5a69cf32a4f22dc27e3e3834d
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt_web_email_settings-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Netping/OWRT-WEB-email-settings.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt_web_email_settings
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=web interface for email module
  URL:=https://github.com/Netping/OWRT-WEB-email-settings
  MAINTAINER:=Alexander Stepanov <info@netping.ru>
  DEPENDS:=
endef

define Package/owrt_web_email_settings/description
 Web interface for email module
endef

MODULE_DIR_NAME:=owrt_web_email_settings
MODULE_FILES_DIR:=/usr/lib/lua/luci/
ACL_FILES_DIR:=/usr/share/rpcd/acl.d/
MENU_FILES_DIR:=/usr/share/luci/menu.d/
STATIC_FILES_DIR:=/www/luci-static/resources/view/

define Package/owrt_web_email_settings/install
	mkdir -p $(1)$(MODULE_FILES_DIR)
	cp -r $(PKG_BUILD_DIR)/luasrc/* $(1)$(MODULE_FILES_DIR)
	mkdir -p $(1)$(STATIC_FILES_DIR)
	cp -r $(PKG_BUILD_DIR)/htdocs/luci-static/resources/view/* $(1)$(STATIC_FILES_DIR)
	mkdir -p $(1)$(ACL_FILES_DIR)
	cp -r $(PKG_BUILD_DIR)/root/usr/share/rpcd/acl.d/* $(1)$(ACL_FILES_DIR)
	mkdir -p $(1)$(MENU_FILES_DIR)
	cp -r $(PKG_BUILD_DIR)/root/usr/share/luci/menu.d/* $(1)$(MENU_FILES_DIR)
endef

$(eval $(call BuildPackage,owrt_web_email_settings))
