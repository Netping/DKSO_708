include $(TOPDIR)/rules.mk

PKG_NAME:=np-gpio-management
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/np-gpio-management-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/Netping/DKST708_gpio_management/releases/download/v1.0.0/
PKG_HASH:=4d1168b0f814815b3d7a7279befd754d4f725c7cf57471d2550a6f97514ae1b3


PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/np-gpio-management
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Utils and boot scripts
  TITLE:=GPIO initialization scripts
  URL:=https://github.com/Netping/DKST708_gpio_management
  MAINTAINER:=Michael Sadikov <info@netping.ru>
endef

define Package/np-gpio-management/description
 Package of GPIO initialization scripts
endef

define Package/np-gpio-management/install
	$(INSTALL_DIR) $(1)/root
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/shell_scripts/* $(1)/root/
endef

$(eval $(call BuildPackage,np-gpio-management))
