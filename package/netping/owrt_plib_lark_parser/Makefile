include $(TOPDIR)/rules.mk

PKG_NAME:="owrt_plib_lark_parser"
PKG_VERSION:=0.11.3
PKG_REV:=09b3b6057881d0994f817514681b1fa08a4cfe29
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt_plib_lark_parser-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Netping/OWRT-PLIB-Lark-parser.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz


PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt_plib_lark_parser
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=Lark is a parsing toolkit for Python
  URL:=https://github.com/Netping/OWRT-PLIB-Lark-parser
  MAINTAINER:=Michael Sadikov <info@netping.ru>
endef

define Package/owrt_plib_lark_parser/description
 Lark is a parsing toolkit for Python
endef

define Package/owrt_plib_lark_parser/install
	mkdir -p $(1)/usr/lib/python3.7/site-packages/lark
	mkdir -p $(1)/usr/lib/python3.7/site-packages/lark-stubs
	mkdir -p $(1)/usr/lib/python3.7/site-packages/lark_parser-0.11.3-py3.7.egg-info
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/lark
	cp -r $(PKG_BUILD_DIR)/lark/* $(1)/usr/lib/python3.7/site-packages/lark
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/lark-stubs
	cp -r  $(PKG_BUILD_DIR)/lark-stubs/* $(1)/usr/lib/python3.7/site-packages/lark-stubs
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/lark_parser-0.11.3-py3.7.egg-info
	cp -r  $(PKG_BUILD_DIR)/lark_parser-0.11.3-py3.7.egg-info/* $(1)/usr/lib/python3.7/site-packages/lark_parser-0.11.3-py3.7.egg-info

	mkdir -p $(1)/usr/lib/python3.7/site-packages/pyjsparser
	mkdir -p $(1)/usr/lib/python3.7/site-packages/pyjsparser-2.7.1.dist-info
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/pyjsparser
	cp -r $(PKG_BUILD_DIR)/pyjsparser/* $(1)/usr/lib/python3.7/site-packages/pyjsparser
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/pyjsparser-2.7.1.dist-info
	cp -r  $(PKG_BUILD_DIR)/pyjsparser-2.7.1.dist-info/* $(1)/usr/lib/python3.7/site-packages/pyjsparser-2.7.1.dist-info

	mkdir -p $(1)/usr/lib/python3.7/site-packages
	mkdir -p $(1)/usr/lib/python3.7/site-packages/six-1.16.0.dist-info
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages
	cp -r $(PKG_BUILD_DIR)/six.py $(1)/usr/lib/python3.7/site-packages
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/six-1.16.0.dist-info
	cp -r  $(PKG_BUILD_DIR)/six-1.16.0.dist-info/* $(1)/usr/lib/python3.7/site-packages/six-1.16.0.dist-info
endef

$(eval $(call BuildPackage,owrt_plib_lark_parser))
