include $(TOPDIR)/rules.mk

PKG_NAME:=owrt_plib_icmplib
PKG_VERSION:=3.0.2-1
PKG_REV:=1cf2548e2162a033277a39db9bbd8dadeb802457
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt_plib_icmplib-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/Netping/OWRT-PLIB-icmplib.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt_plib_icmplib
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=
  URL:=https://github.com/Netping/OWRT-PLIB-icmplib
  MAINTAINER:=Leonid Khlebushchev <info@netping.ru>
endef

define Package/owrt_plib_icmplib/description
 ICMPlib and dependencies
endef

define Package/owrt_plib_icmplib/install
	mkdir -p $(1)/usr/lib/python3.7/site-packages/
	mkdir -p $(1)/usr/lib/python3.7/site-packages/icmplib
	mkdir -p $(1)/usr/lib/python3.7/site-packages/icmplib-3.0.2.dist-info
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/icmplib
	cp -r $(PKG_BUILD_DIR)/icmplib/* $(1)/usr/lib/python3.7/site-packages/icmplib
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/icmplib-3.0.2.dist-info
	cp -r  $(PKG_BUILD_DIR)/icmplib-3.0.2.dist-info/* $(1)/usr/lib/python3.7/site-packages/icmplib-3.0.2.dist-info
endef

define Package/owrt_digital_inputs/clean
	rm -rf $(1)/usr/lib/python3.7/site-packages/icmplib
	rm -rf $(1)/usr/lib/python3.7/site-packages/icmplib-3.0.2.dist-info
endef

$(eval $(call BuildPackage,owrt_plib_icmplib))
