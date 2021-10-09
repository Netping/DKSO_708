include $(TOPDIR)/rules.mk

PKG_NAME:=np-puresnmp-deps
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/np-puresnmp-deps-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/Netping/OWRT_PLIB_PureSNMP/files/7316278/
PKG_HASH:=c1b9bd8ea5554a0d41c77f77efed0bb307580ef1d3b1fc16c50a46165b2803b0


PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/np-puresnmp-deps
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Utils and boot scripts
  TITLE:=PureSNMP and dependencies
  URL:=https://github.com/Netping/OWRT_PLIB_PureSNMP
  MAINTAINER:=Michael Sadikov <info@netping.ru>
endef

define Package/np-puresnmp-deps/description
 PureSNMP and dependencies
endef

define Package/np-puresnmp-deps/install
	mkdir -p $(1)/usr/lib/python3.7/site-packages/
	mkdir -p $(1)/usr/lib/python3.7/site-packages/importlib_metadata-4.8.1.dist-info
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/importlib_metadata
	cp -r $(PKG_BUILD_DIR)/importlib_metadata/* $(1)/usr/lib/python3.7/site-packages/importlib_metadata
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/importlib_metadata-4.8.1.dist-info
	cp -r  $(PKG_BUILD_DIR)/importlib_metadata-4.8.1.dist-info/* $(1)/usr/lib/python3.7/site-packages/importlib_metadata-4.8.1.dist-info

	mkdir -p $(1)/usr/lib/python3.7/site-packages/puresnmp
	mkdir -p $(1)/usr/lib/python3.7/site-packages/puresnmp-1.11.0.dist-info
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/puresnmp
	cp -r $(PKG_BUILD_DIR)/puresnmp/* $(1)/usr/lib/python3.7/site-packages/puresnmp
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/puresnmp-1.11.0.dist-info
	cp -r  $(PKG_BUILD_DIR)/puresnmp-1.11.0.dist-info/* $(1)/usr/lib/python3.7/site-packages/puresnmp-1.11.0.dist-info

	mkdir -p $(1)/usr/lib/python3.7/site-packages
	mkdir -p $(1)/usr/lib/python3.7/site-packages/six-1.16.0.dist-info
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages
	cp -r $(PKG_BUILD_DIR)/six.py $(1)/usr/lib/python3.7/site-packages
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/six-1.16.0.dist-info
	cp -r  $(PKG_BUILD_DIR)/six-1.16.0.dist-info/* $(1)/usr/lib/python3.7/site-packages/six-1.16.0.dist-info

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

$(eval $(call BuildPackage,np-puresnmp-deps))
