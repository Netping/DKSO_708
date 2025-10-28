include $(TOPDIR)/rules.mk

PKG_NAME:=owrt-plib-puresnmp
PKG_VERSION:=1.11.0-1
PKG_REV:=1d64a1fe28d12dd09f297b50c1e3e63843f206d1
PKG_RELEASE:=7

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-plib-puresnmp-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-PLIB-puresnmp.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-plib-puresnmp
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=PLIB
  TITLE:=PureSNMP and dependencies
  URL:=https://github.com/Netping/OWRT-PLIB-puresnmp
  MAINTAINER:=Michael Sadikov <info@netping.ru>
  DEPENDS:=+owrt-plib-zipp +owrt-plib-importlib-metadata +owrt-plib-typing-extensions
endef

define Package/owrt-plib-puresnmp/description
 PureSNMP and dependencies
endef

define Package/owrt-plib-puresnmp/install
#	mkdir -p $(1)/usr/lib/python3.7/site-packages/
#	mkdir -p $(1)/usr/lib/python3.7/site-packages/puresnmp
#	mkdir -p $(1)/usr/lib/python3.7/site-packages/puresnmp-1.11.0.dist-info
	
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/puresnmp
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/puresnmp-1.11.0.dist-info
	
	cp -r $(PKG_BUILD_DIR)/puresnmp/* $(1)/usr/lib/python3.7/site-packages/puresnmp
	cp -r $(PKG_BUILD_DIR)/puresnmp-1.11.0.dist-info/* $(1)/usr/lib/python3.7/site-packages/puresnmp-1.11.0.dist-info

	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/t61codec-2.0.0.dist-info
	$(CP) $(PKG_BUILD_DIR)/t61codec.py $(1)/usr/lib/python3.7/site-packages/
	cp -r $(PKG_BUILD_DIR)/t61codec-2.0.0.dist-info/* $(1)/usr/lib/python3.7/site-packages/t61codec-2.0.0.dist-info

	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/verlib-0.1-py3.7.egg-info
	$(CP) $(PKG_BUILD_DIR)/verlib.py $(1)/usr/lib/python3.7/site-packages
	cp -r $(PKG_BUILD_DIR)/verlib-0.1-py3.7.egg-info/* $(1)/usr/lib/python3.7/site-packages/verlib-0.1-py3.7.egg-info
	
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/six-1.16.0.dist-info
	$(CP) $(PKG_BUILD_DIR)/six.py $(1)/usr/lib/python3.7/site-packages/
	cp -r $(PKG_BUILD_DIR)/six-1.16.0.dist-info/* $(1)/usr/lib/python3.7/site-packages/six-1.16.0.dist-info
	
endef

define Package/owrt-plib-puresnmp/clean
	rm -rf $(1)/usr/lib/python3.7/site-packages/puresnmp
	rm -rf $(1)/usr/lib/python3.7/site-packages/puresnmp-1.11.0.dist-info
	rm -rf $(1)/usr/lib/python3.7/site-packages/t61codec-2.0.0.dist-info
	rm -rf $(1)/usr/lib/python3.7/site-packages/verlib-0.1-py3.7.egg-info
	rm -rf $(1)/usr/lib/python3.7/site-packages/six-1.16.0.dist-info
	rm $(1)/usr/lib/python3.7/site-packages/t61codec.py
	rm $(1)/usr/lib/python3.7/site-packages/verlib.py
	rm $(1)/usr/lib/python3.7/site-packages/six.py

endef

$(eval $(call BuildPackage,owrt-plib-puresnmp))
