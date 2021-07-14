include $(TOPDIR)/rules.mk

PKG_NAME:=np-python-deps
PKG_VERSION:=1.0.1
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/np-python-deps-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/Netping/dksf708_python_deps/files/6815732/
PKG_HASH:=b300b1d4e21e2434f313226056c3f9c817050acc78a8fb4199eb99a323f36b52


PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/np-python-deps
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Utils and boot scripts
  TITLE:=NetPing python dependencies
  URL:=https://github.com/Netping/DKST708_python-deps
  MAINTAINER:=Michael Sadikov <info@netping.ru>
endef

define Package/np-python-deps/description
 NetPing python dependencies
endef

define Package/np-python-deps/install
	mkdir -p $(1)/usr/lib/python3.7/site-packages/aiosnmp
	mkdir -p $(1)/usr/lib/python3.7/site-packages/aiosnmp-0.3.1.dist-info
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/aiosnmp
	cp -r $(PKG_BUILD_DIR)/aiosnmp/* $(1)/usr/lib/python3.7/site-packages/aiosnmp
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/aiosnmp-0.3.1.dist-info
	cp -r  $(PKG_BUILD_DIR)/aiosnmp-0.3.1.dist-info/* $(1)/usr/lib/python3.7/site-packages/aiosnmp-0.3.1.dist-info

	mkdir -p $(1)/usr/lib/python3.7/site-packages/ply
	mkdir -p $(1)/usr/lib/python3.7/site-packages/ply-3.11.dist-info
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/ply
	cp -r $(PKG_BUILD_DIR)/ply/* $(1)/usr/lib/python3.7/site-packages/ply
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/ply-3.11.dist-info
	cp -r  $(PKG_BUILD_DIR)/ply-3.11.dist-info/* $(1)/usr/lib/python3.7/site-packages/ply-3.11.dist-info

	mkdir -p $(1)/usr/lib/python3.7/site-packages/pyasn1
	mkdir -p $(1)/usr/lib/python3.7/site-packages/pyasn1-0.4.8.dist-info
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/pyasn1
	cp -r $(PKG_BUILD_DIR)/pyasn1/* $(1)/usr/lib/python3.7/site-packages/pyasn1
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/pyasn1-0.4.8.dist-info
	cp -r  $(PKG_BUILD_DIR)/pyasn1-0.4.8.dist-info/* $(1)/usr/lib/python3.7/site-packages/pyasn1-0.4.8.dist-info

	mkdir -p $(1)/usr/lib/python3.7/site-packages/pysmi
	mkdir -p $(1)/usr/lib/python3.7/site-packages/pysmi-0.3.4.dist-info
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/pysmi
	cp -r $(PKG_BUILD_DIR)/pysmi/* $(1)/usr/lib/python3.7/site-packages/pysmi
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/pysmi-0.3.4.dist-info
	cp -r  $(PKG_BUILD_DIR)/pysmi-0.3.4.dist-info/* $(1)/usr/lib/python3.7/site-packages/pysmi-0.3.4.dist-info

	 mkdir -p $(1)/usr/lib/python3.7/site-packages/pysnmp
	mkdir -p $(1)/usr/lib/python3.7/site-packages/pysnmp-4.4.12.dist-info
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/pysnmp
	cp -r $(PKG_BUILD_DIR)/pysnmp/* $(1)/usr/lib/python3.7/site-packages/pysnmp
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/pysnmp-4.4.12.dist-info
	cp -r  $(PKG_BUILD_DIR)/pysnmp-4.4.12.dist-info/* $(1)/usr/lib/python3.7/site-packages/pysnmp-4.4.12.dist-info

	mkdir -p $(1)/usr/lib/python3.7/site-packages/Cryptodome
	mkdir -p $(1)/usr/lib/python3.7/site-packages/pycryptodomex-3.10.1.dist-info
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/Cryptodome
	cp -r $(PKG_BUILD_DIR)/Cryptodome/* $(1)/usr/lib/python3.7/site-packages/Cryptodome
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/pycryptodomex-3.10.1.dist-info
	cp -r  $(PKG_BUILD_DIR)/pycryptodomex-3.10.1.dist-info/* $(1)/usr/lib/python3.7/site-packages/pycryptodomex-3.10.1.dist-info

	mkdir -p $(1)/usr/lib/python3.7/site-packages/pythonping
	mkdir -p $(1)/usr/lib/python3.7/site-packages/pythonping-1.1.0.dist-info
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/pythonping
	cp -r $(PKG_BUILD_DIR)/pythonping/* $(1)/usr/lib/python3.7/site-packages/pythonping
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/pythonping-1.1.0.dist-info
	cp -r  $(PKG_BUILD_DIR)/pythonping-1.1.0.dist-info/* $(1)/usr/lib/python3.7/site-packages/pythonping-1.1.0.dist-info
endef

$(eval $(call BuildPackage,np-python-deps))
