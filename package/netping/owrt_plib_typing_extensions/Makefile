include $(TOPDIR)/rules.mk

PKG_NAME:="owrt_plib_typing_extensions"
PKG_VERSION:=4.1.1-1
PKG_REV:=196ab9fb256f9ece237624c724927a89f401bb5f
PKG_RELEASE:=2

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt_plib_typing_extensions-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Netping/OWRT-PLIB-typing-extensions.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt_plib_typing_extensions
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=Python typing-extensions 4.1.1 library
  URL:=https://github.com/Netping/OWRT-PLIB-typing-extensions
  MAINTAINER:=Leonid Khlebushchev <info@netping.ru>
endef

define Package/owrt_plib_typing_extensions/description
 Python typing-extensions 4.1.1 library
endef

define Package/owrt_plib_typing_extensions/install
	mkdir -p $(1)/usr/lib/python3.7/site-packages
	mkdir -p $(1)/usr/lib/python3.7/site-packages/typing_extensions-4.1.1.dist-info
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages
	cp -r $(PKG_BUILD_DIR)/*.py $(1)/usr/lib/python3.7/site-packages/
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/typing_extensions-4.1.1.dist-info
	cp -r  $(PKG_BUILD_DIR)/typing_extensions-4.1.1.dist-info/* $(1)/usr/lib/python3.7/site-packages/typing_extensions-4.1.1.dist-info/
endef

$(eval $(call BuildPackage,owrt_plib_typing_extensions))
