include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-plib-pyserial"
PKG_VERSION:=3.5.0-1
PKG_REV:=6d526d8efb71113fbb4f7d9ab887e4243c96a0ca
PKG_RELEASE:=5

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-plib-pyserial-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-PLIB-pyserial.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-plib-pyserial
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=Python serial 3.5.0 library
  URL:=https://github.com/Netping/OWRT-PLIB-pyserial
  MAINTAINER:=Egor Zyryanov <info@netping.ru>
endef

define Package/owrt-plib-pyserial/description
 Python serial 3.5.0 library
endef

SITE_PACKAGE_DIR:=/usr/lib/python3.7/site-packages/
MODULE_SRC_DIR:=serial
MODULE_DIST_DIR:=pyserial-3.5.dist-info



define Package/owrt-plib-pyserial/install
	$(INSTALL_DIR) $(1)$(SITE_PACKAGE_DIR)$(MODULE_SRC_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(MODULE_SRC_DIR)/* $(1)$(SITE_PACKAGE_DIR)$(MODULE_SRC_DIR)
	
	$(INSTALL_DIR) $(1)$(SITE_PACKAGE_DIR)$(MODULE_DIST_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(MODULE_DIST_DIR)/* $(1)$(SITE_PACKAGE_DIR)$(MODULE_DIST_DIR)

endef

define Package/owrt-plib-pyserial/remove
	rm -rf $(SITE_PACKAGE_DIR)$(MODULE_FILES_DIR_SRC)
	rm -rf $(SITE_PACKAGE_DIR)$(MODULE_FILES_DIR_DIST)
endef

$(eval $(call BuildPackage,owrt-plib-pyserial))
