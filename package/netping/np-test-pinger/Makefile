include $(TOPDIR)/rules.mk

PKG_NAME:=np-test-pinger
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/np-test-pinger-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/Netping/TestPinger/files/6803955/
PKG_HASH:=1b46e816686ceeca174b2081cd65216c8cdab4a6d403ba687e10c4c1f15171f3


PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/np-test-pinger
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Utils and boot scripts
  TITLE:=test module for polling network resources
  URL:=https://github.com/Netping/TestPinger
  MAINTAINER:=Michael Sadikov <info@netping.ru>
endef

define Package/np-test-pinger/description
 test module for polling network resources
endef

define Package/np-test-pinger/install
	$(INSTALL_DIR) $(1)/root/np-test-pinger/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/testpinger.py $(1)/root/np-test-pinger/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/config.json $(1)/root/np-test-pinger/
endef

$(eval $(call BuildPackage,np-test-pinger))
