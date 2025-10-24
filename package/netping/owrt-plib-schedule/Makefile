include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-plib-schedule"
PKG_VERSION:=1.1.0-1
PKG_REV:=667a77e06a822c1c780a2df0b8f5cfce2061891e
PKG_RELEASE:=4

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-plib-schedule-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-PLIB-schedule.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-plib-schedule
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=PLIB
  TITLE:=Python schedule 1.1.0-1 library
  URL:=https://github.com/Netping/OWRT-PLIB-schedule
  MAINTAINER:=Leonid Khlebushchev <info@netping.ru>
endef

define Package/owrt-plib-schedule/description
 Python schedule 1.1.0-1 library
endef


SITE_PACKAGE_DIR:=/usr/lib/python3.7/site-packages/
MODULE_SRC_DIR:=schedule
MODULE_DIST_DIR:=schedule-1.1.0.dist-info

define Package/owrt-plib-schedule/install
	$(INSTALL_DIR) $(1)$(SITE_PACKAGE_DIR)$(MODULE_SRC_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(MODULE_SRC_DIR)/* $(1)$(SITE_PACKAGE_DIR)$(MODULE_SRC_DIR)
	
	$(INSTALL_DIR) $(1)$(SITE_PACKAGE_DIR)$(MODULE_DIST_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(MODULE_DIST_DIR)/* $(1)$(SITE_PACKAGE_DIR)$(MODULE_DIST_DIR)
endef

define Package/owrt-plib-schedule/remove
	rm -rf $(SITE_PACKAGE_DIR)$(MODULE_FILES_DIR_SRC)
	rm -rf $(SITE_PACKAGE_DIR)$(MODULE_FILES_DIR_DIST)
endef
$(eval $(call BuildPackage,owrt-plib-schedule))
