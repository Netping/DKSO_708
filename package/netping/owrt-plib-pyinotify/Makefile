include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-plib-pyinotify"
PKG_VERSION:=0.9.6-1
PKG_REV:=27d7b6458a250b11fc53107f48e331c2c16ba8a9
PKG_RELEASE:=6

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-plib-pyinotify-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-PLIB-pyinotify.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-plib-pyinotify
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=PLIB
  TITLE:=Python inotify 0.9.6 library
  URL:=https://github.com/Netping/OWRT-PLIB-pyinotify
  MAINTAINER:=Netping East <info@netping.ru>
endef


SITE_PACKAGE_DIR:=/usr/lib/python3.7/site-packages/


define Package/owrt-plib-pyinotify/description
 Python inotify 0.9.6 library
endef

define Package/owrt-plib-pyinotify/install
	$(INSTALL_DIR) $(1)$(SITE_PACKAGE_DIR)/pyinotify-0.9.6.dist-info/
	$(CP) $(PKG_BUILD_DIR)/pyinotify-0.9.6.dist-info/* $(1)$(SITE_PACKAGE_DIR)/pyinotify-0.9.6.dist-info/
	
	$(CP) $(PKG_BUILD_DIR)/python3/*.py $(1)/usr/lib/python3.7/

endef

$(eval $(call BuildPackage,owrt-plib-pyinotify))
