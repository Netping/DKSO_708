include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-plib-zipp"
PKG_VERSION:=3.7.0-1
PKG_REV:=2198d161dcd250eeb7555df9e92faf7f3cf6e96c
PKG_RELEASE:=2

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-plib-zipp-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-PLIB-zipp.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-plib-zipp
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=Python zipp 3.7.0-1 library
  URL:=https://github.com/Netping/OWRT-PLIB-zipp
  MAINTAINER:=Leonid Khlebushchev <info@netping.ru>
endef

SITE_PACKAGES_DIR:=/usr/lib/python3.7/site-packages

define Package/owrt-plib-zipp/description
 Python zipp 3.7.0-1 library
endef

define Package/owrt-plib-zipp/install
	$(INSTALL_DIR) $(1)$(SITE_PACKAGES_DIR)/zipp-3.7.0.dist-info
	$(CP) $(PKG_BUILD_DIR)/*.py $(1)$(SITE_PACKAGES_DIR)/
	
	$(CP) $(PKG_BUILD_DIR)/zipp-3.7.0.dist-info/* $(1)$(SITE_PACKAGES_DIR)/zipp-3.7.0.dist-info/
endef

$(eval $(call BuildPackage,owrt-plib-zipp))
