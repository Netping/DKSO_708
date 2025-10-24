include $(TOPDIR)/rules.mk
PKG_NAME:=python3-dbus-next
PKG_VERSION:=0.2.3
PKG_RELEASE:=1

PKG_HASH:=f4eae26909332ada528c0a3549dda8d4f088f9b365153952a408e28023a626a5

PKG_SOURCE:=dbus_next-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://files.pythonhosted.org/packages/ce/45/6a40fbe886d60a8c26f480e7d12535502b5ba123814b3b9a0b002ebca198/

PKG_MAINTAINER:=Your Name <your@email.com>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE
PKG_BUILD_DIR:=$(BUILD_DIR)/dbus_next-$(PKG_VERSION)

#PYTHON_VERSION:=3.7
#PYTHON_INCLUDE_DIR:=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION)
#PYTHON_LIB_DIR:=$(STAGING_DIR)/usr/lib
#PYTHON_PATH:=/usr/bin/python$(PYTHON_VERSION)
#PYTHON_SITE_PACKAGES:=/usr/lib/python$(PYTHON_VERSION)/site-packages
#PYTHON3_VERSION:=3.7
#PYTHON3_PKG_DIR:=/usr/lib/python$(PYTHON3_VERSION)/site-packages
## Явно указываем версию Python
#PYTHON3_PKG_SETUP_ARGS:=
#PYTHON3_PKG_SETUP_VARS:= \
#    PYTHONPATH="$(PYTHON3_LIB_DIR):$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION)/site-packages"
#PYTHON3_BIN:=$(STAGING_DIR_HOSTPKG)/bin/python3.7
#PYTHON3:=$(STAGING_DIR_HOSTPKG)/bin/python3.7

#include $(TOPDIR)/package/lang/python/python3-version.mk
#include $(TOPDIR)/package/lang/python/python3-package.mk
#include $(TOPDIR)/package/lang/python/pypi.mk
#include $(INCLUDE_DIR)/package.mk

include $(TOPDIR)/package/lang/python/python3-version.mk
#include $(TOPDIR)/package/lang/python/pypi.mk
include $(INCLUDE_DIR)/package.mk


#$(call include_mk, python3-package.mk)

define Package/python3-dbus-next
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Python
  TITLE:=dbus-next
  URL:=https://github.com/altdesktop/python-dbus-next
  DEPENDS:=+python3-light +python3-asyncio
endef

define Package/python3-dbus-next/description
  A zero-dependency DBus library for Python with asyncio support.
endef

define Build/Compile
	# Ничего не компилируем, только установка питоновских файлов
	true
endef

define Package/python3-dbus-next/install
	$(INSTALL_DIR) $(1)/usr
	cd $(PKG_BUILD_DIR); \
		PYTHONPATH="$(1)/usr/lib/python$(PYTHON3_VERSION)/site-packages" \
		$(STAGING_DIR_HOSTPKG)/bin/python3 setup.py install \
			--prefix=/usr \
			--root=$(1) \
			--single-version-externally-managed \
			--record=/dev/null
endef

#define Package/python3-dbus-next/install
#	$(INSTALL_DIR) $(1)$(PYTHON3_PKG_DIR)
#	$(CP) $(PKG_BUILD_DIR)/dbus_next $(1)$(PYTHON3_PKG_DIR)/
#endef

#$(eval $(call Py3Package,python3-dbus-next))
$(eval $(call BuildPackage,python3-dbus-next))
