include $(TOPDIR)/rules.mk

PKG_NAME:=np-test-pinger
PKG_VERSION:=5.2.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/np-test-pinger-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/Netping/TestPinger/files/6983617/
PKG_HASH:=38ee1cee6679d5e0a1873acfdfdef5c1f11354f59ced9abde726b7651e0a05d6


PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/np-test-pinger
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Utils and boot scripts
  TITLE:=test module for polling network resources
  URL:=https://github.com/Netping/TestPinger
  MAINTAINER:=Andrei Zelenin <info@netping.ru>
endef

define Package/np-test-pinger/description
 test module for polling network resources
endef

define Package/np-test-pinger/install
	$(INSTALL_DIR) $(1)/root/np-test-pinger/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/testpinger.py $(1)/root/np-test-pinger/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/httpconf $(1)/root/np-test-pinger/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/configchange.py $(1)/root/np-test-pinger/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/pingconf $(1)/root/np-test-pinger/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/protocol.py $(1)/root/np-test-pinger/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/snmpconf $(1)/root/np-test-pinger/
endef

$(eval $(call BuildPackage,np-test-pinger))
