include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-plib-chardet"
PKG_VERSION:=4.0.0
PKG_REV:=3e19186c985cfadc093177b3a4a376a4531ad5b5
PKG_RELEASE:=5

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-plib-chardet-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-PLIB-chardet.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1


include $(INCLUDE_DIR)/package.mk

define Package/owrt-plib-chardet
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=PLIB
  TITLE:=The Universal Character Encoding Detector
  URL:=https://github.com/Netping/OWRT-PLIB-chardet
  MAINTAINER:=NetPing East <info@netping.ru>
endef

define Package/owrt-plib-chardet/description
 The Universal Character Encoding Detector
endef


MODULE_FILES_DIR?=/usr/lib/python3.7/site-packages/
MODULE_FILES_DIR_SRC=/usr/lib/python3.7/site-packages/chardet
MODULE_FILES_DIR_DIST=/usr/lib/python3.7/site-packages/chardet-4.0.0.dist-info

ETC_FILES=
ETC_FILES_DIR=/etc/netping/$(PKG_NAME)

define Package/owrt-plib-chardet/install
#	mkdir -p $(1)$(MODULE_FILES_DIR)
	$(INSTALL_DIR) $(1)$(MODULE_FILES_DIR_SRC)
	$(CP) $(PKG_BUILD_DIR)/chardet/* $(1)$(MODULE_FILES_DIR_SRC)	
	
	$(INSTALL_DIR) $(1)$(MODULE_FILES_DIR_DIST)
	$(CP) $(PKG_BUILD_DIR)/chardet-4.0.0.dist-info/* $(1)$(MODULE_FILES_DIR_DIST)


endef

define Package/owrt-plib-chardet/remove
	rm -rf $(MODULE_FILES_DIR_SRC)
	rm -rf $(MODULE_FILES_DIR_DIST)
endef
$(eval $(call BuildPackage,owrt-plib-chardet))
