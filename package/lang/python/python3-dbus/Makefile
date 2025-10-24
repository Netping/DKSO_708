include $(TOPDIR)/rules.mk

PKG_NAME:=python3-dbus
#PKG_VERSION:=1.2.18
#PKG_VERSION:=1.4.0
PKG_VERSION:=1.3.2
PKG_RELEASE:=1

PKG_SOURCE:=dbus-python-$(PKG_VERSION).tar.gz
#PKG_SOURCE:=dbus-python-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=https://dbus.freedesktop.org/releases/dbus-python/
#PKG_HASH:=92bdd1e68b45596c833307a5ff4b217ee6929a1502f5341bae28fd120acf7260
#PKG_HASH:=c36b28f10ffcc8f1f798aca973bcc132f91f33eb9b6b8904381b4077766043d5
PKG_HASH:=ad67819308618b5069537be237f8e68ca1c7fcc95ee4a121fe6845b1418248f8

PKG_BUILD_DIR:=$(BUILD_DIR)/dbus-python-$(PKG_VERSION)

#HOST_BUILD_DEPENDS:=autoconf-archive/host
#PKG_FIXUP:=autoreconf

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=COPYING
PKG_MAINTAINER:=Your Name <your.email@example.com>

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/package/lang/python/python3-package.mk

PYTHON_VERSION:=3.7
PYTHON_INCLUDE_DIR:=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION)
PYTHON_LIB_DIR:=$(STAGING_DIR)/usr/lib
PYTHON_PATH:=/usr/bin/python$(PYTHON_VERSION)
PYTHON_SITE_PACKAGES:=/usr/lib/python$(PYTHON_VERSION)/site-packages
PYTHON3_VERSION:=3.7
PYTHON3_PKG_DIR:=/usr/lib/python$(PYTHON3_VERSION)/site-packages

TARGET_CFLAGS += -I$(PYTHON_INCLUDE_DIR)
TARGET_LDFLAGS += -L$(PYTHON_LIB_DIR) -lpython$(PYTHON_VERSION)

define Package/python3-dbus
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=Python3 bindings for D-Bus
  URL:=https://www.freedesktop.org/wiki/Software/DBusBindings/
  DEPENDS:=+python3-light +dbus +libdbus +glib2 +python3
endef

define Package/python3-dbus/description
  Python3 bindings for D-Bus.
endef

#define Build/Prepare
#	$(call Build/Prepare/Default)
##	$(SED) 's/AX_IS_RELEASE(micro-version)/AC_DEFINE([MICRO_VERSION], [0], [Micro version])/' $(PKG_BUILD_DIR)/configure.ac
#	(cd $(PKG_BUILD_DIR) && \
#		PYTHON=python3 \
#		PYTHON_LIBS="-L$(STAGING_DIR)/usr/lib -lpython3.7" \
#		PYTHON_CPPFLAGS="-I$(STAGING_DIR)/usr/include/python3.7" \
#		./autogen.sh \
#		--disable-documentation \
#		--disable-tests )
##	#(cd $(PKG_BUILD_DIR) && autoreconf -fi)
#endef


define Build/Configure
	$(call Build/Configure/Default, \
		PYTHON=python3 \
		PYTHON_LIBS="-L$(STAGING_DIR)/usr/lib -lpython3.7" \
		PYTHON_CPPFLAGS="-I$(STAGING_DIR)/usr/include/python3.7" \
		--disable-documentation \
		--disable-tests \
	)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)
endef

define Build/Install
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR=$(PKG_INSTALL_DIR) install
endef

#define Package/python3-dbus/install
#	$(INSTALL_DIR) $(1)/usr/lib/python$(PYTHON_VERSION)/site-packages
#	$(CP) $(PKG_INSTALL_DIR)/usr/lib/python$(PYTHON_VERSION)/site-packages/* \
#		$(1)/usr/lib/python$(PYTHON_VERSION)/site-packages/
#endef


define Package/python3-dbus/install
	$(INSTALL_DIR) $(1)/usr/lib/python3.7/site-packages
	$(CP) -r $(PKG_INSTALL_DIR)/usr/lib/python3.8/site-packages/* $(1)/usr/lib/python3.7/site-packages/
endef


$(eval $(call BuildPackage,python3-dbus))

