include $(TOPDIR)/rules.mk

PKG_NAME:=owrt_plib_puresnmp
PKG_VERSION:=1.11.0-1
PKG_REV:=aed4e4dacc96a5e2a011bfeec120f5cf10a9370d
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt_plib_puresnmp-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Netping/OWRT_PLIB_PureSNMP.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt_plib_puresnmp
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=PureSNMP and dependencies
  URL:=https://github.com/Netping/OWRT_PLIB_PureSNMP
  MAINTAINER:=Michael Sadikov <info@netping.ru>
endef

define Package/owrt_plib_puresnmp/description
 PureSNMP and dependencies
endef

define Package/owrt_plib_puresnmp/install
	mkdir -p $(1)/usr/lib/python3.7/site-packages/
	mkdir -p $(1)/usr/lib/python3.7/site-packages/puresnmp
	mkdir -p $(1)/usr/lib/python3.7/site-packages/puresnmp-1.11.0.dist-info
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/puresnmp
	cp -r $(PKG_BUILD_DIR)/puresnmp/* $(1)/usr/lib/python3.7/site-packages/puresnmp
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/puresnmp-1.11.0.dist-info
	cp -r  $(PKG_BUILD_DIR)/puresnmp-1.11.0.dist-info/* $(1)/usr/lib/python3.7/site-packages/puresnmp-1.11.0.dist-info

	mkdir -p $(1)/usr/lib/python3.7/site-packages
	mkdir -p $(1)/usr/lib/python3.7/site-packages/t61codec-2.0.0.dist-info
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages
	cp -r $(PKG_BUILD_DIR)/t61codec.py $(1)/usr/lib/python3.7/site-packages
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/t61codec-2.0.0.dist-info
	cp -r  $(PKG_BUILD_DIR)/t61codec-2.0.0.dist-info/* $(1)/usr/lib/python3.7/site-packages/t61codec-2.0.0.dist-info

	mkdir -p $(1)/usr/lib/python3.7/site-packages
	mkdir -p $(1)/usr/lib/python3.7/site-packages/typing_extensions-3.10.0.2.dist-info
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages
	cp -r $(PKG_BUILD_DIR)/typing_extensions.py $(1)/usr/lib/python3.7/site-packages
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/typing_extensions-3.10.0.2.dist-info
	cp -r  $(PKG_BUILD_DIR)/typing_extensions-3.10.0.2.dist-info/* $(1)/usr/lib/python3.7/site-packages/typing_extensions-3.10.0.2.dist-info

	mkdir -p $(1)/usr/lib/python3.7/site-packages
	mkdir -p $(1)/usr/lib/python3.7/site-packages/verlib-0.1-py3.7.egg-info
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages
	cp -r $(PKG_BUILD_DIR)/verlib.py $(1)/usr/lib/python3.7/site-packages
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/verlib-0.1-py3.7.egg-info
	cp -r  $(PKG_BUILD_DIR)/verlib-0.1-py3.7.egg-info/* $(1)/usr/lib/python3.7/site-packages/verlib-0.1-py3.7.egg-info

	mkdir -p $(1)/usr/lib/python3.7/site-packages
	mkdir -p $(1)/usr/lib/python3.7/site-packages/zipp-3.6.0.dist-info
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages
	cp -r $(PKG_BUILD_DIR)/zipp.py $(1)/usr/lib/python3.7/site-packages
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/zipp-3.6.0.dist-info
	cp -r  $(PKG_BUILD_DIR)/zipp-3.6.0.dist-info/* $(1)/usr/lib/python3.7/site-packages/zipp-3.6.0.dist-info

endef

$(eval $(call BuildPackage,owrt_plib_puresnmp))
