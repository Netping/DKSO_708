include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-plib-typing-extensions"
PKG_VERSION:=4.1.1-1
PKG_REV:=196ab9fb256f9ece237624c724927a89f401bb5f
PKG_RELEASE:=2

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-plib-typing-extensions-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-PLIB-typing-extensions.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-plib-typing-extensions
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=Python typing-extensions 4.1.1 library
  URL:=https://github.com/Netping/OWRT-PLIB-typing-extensions
  MAINTAINER:=Leonid Khlebushchev <info@netping.ru>
endef

SITE_PACKAGE_DIR:=/usr/lib/python3.7/site-packages

define Package/owrt-plib-typing-extensions/description
 Python typing-extensions 4.1.1 library
endef

define Package/owrt-plib-typing-extensions/install
	$(INSTALL_DIR) $(1)$(SITE_PACKAGE_DIR)/typing_extensions-4.1.1.dist-info

	$(CP) $(PKG_BUILD_DIR)/*.py $(1)$(SITE_PACKAGE_DIR)/
	$(CP) $(PKG_BUILD_DIR)/typing_extensions-4.1.1.dist-info/* $(1)$(SITE_PACKAGE_DIR)/typing_extensions-4.1.1.dist-info/
endef

$(eval $(call BuildPackage,owrt-plib-typing-extensions))
