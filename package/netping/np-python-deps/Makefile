include $(TOPDIR)/rules.mk

PKG_NAME:=np-python-deps
PKG_VERSION:=1.1.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/np-python-deps-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/Netping/dksf708_python_deps/files/6982729/
PKG_HASH:=362226a3d36633d0fb85573d05d6c404a2320326d434afe209ed0c71fe6f43f6


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

	mkdir -p $(1)/usr/lib/python3.7/site-packages/urllib3
	mkdir -p $(1)/usr/lib/python3.7/site-packages/urllib3-1.26.6.dist-info
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/urllib3
	cp -r $(PKG_BUILD_DIR)/urllib3/* $(1)/usr/lib/python3.7/site-packages/urllib3
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/urllib3-1.26.6.dist-info
	cp -r  $(PKG_BUILD_DIR)/urllib3-1.26.6.dist-info/* $(1)/usr/lib/python3.7/site-packages/urllib3-1.26.6.dist-info

	mkdir -p $(1)/usr/lib/python3.7/site-packages/charset_normalizer
	mkdir -p $(1)/usr/lib/python3.7/site-packages/charset_normalizer-2.0.4.dist-info
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/charset_normalizer
	cp -r $(PKG_BUILD_DIR)/charset_normalizer/* $(1)/usr/lib/python3.7/site-packages/charset_normalizer
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/charset_normalizer-2.0.4.dist-info
	cp -r  $(PKG_BUILD_DIR)/charset_normalizer-2.0.4.dist-info/* $(1)/usr/lib/python3.7/site-packages/charset_normalizer-2.0.4.dist-info

	mkdir -p $(1)/usr/lib/python3.7/site-packages/idna
	mkdir -p $(1)/usr/lib/python3.7/site-packages/idna-3.2.dist-info
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/idna
	cp -r $(PKG_BUILD_DIR)/idna/* $(1)/usr/lib/python3.7/site-packages/idna
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/idna-3.2.dist-info
	cp -r  $(PKG_BUILD_DIR)/idna-3.2.dist-info/* $(1)/usr/lib/python3.7/site-packages/idna-3.2.dist-info

	mkdir -p $(1)/usr/lib/python3.7/site-packages/certifi
	mkdir -p $(1)/usr/lib/python3.7/site-packages/certifi-2021.5.30.dist-info
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/certifi
	cp -r $(PKG_BUILD_DIR)/certifi/* $(1)/usr/lib/python3.7/site-packages/certifi
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/certifi-2021.5.30.dist-info
	cp -r  $(PKG_BUILD_DIR)/certifi-2021.5.30.dist-info/* $(1)/usr/lib/python3.7/site-packages/certifi-2021.5.30.dist-info

	mkdir -p $(1)/usr/lib/python3.7/site-packages/requests
	mkdir -p $(1)/usr/lib/python3.7/site-packages/requests-2.26.0.dist-info
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/requests
	cp -r $(PKG_BUILD_DIR)/requests/* $(1)/usr/lib/python3.7/site-packages/requests
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages/requests-2.26.0.dist-info
	cp -r  $(PKG_BUILD_DIR)/requests-2.26.0.dist-info/* $(1)/usr/lib/python3.7/site-packages/requests-2.26.0.dist-info
endef

$(eval $(call BuildPackage,np-python-deps))
