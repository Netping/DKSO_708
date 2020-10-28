include $(TOPDIR)/rules.mk

PKG_NAME:=np-backup
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/np-backup-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/Netping/netping_backup/files/5454330/
PKG_HASH:=e5c95240f28399c0c5ac6f44684a14e6c6109f23526fa77110009833ed3b43a2


PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/np-backup
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Utils and boot scripts
  TITLE:=conf file for sysupgrade backup and restore
  URL:=https://github.com/Netping/netping_backup
  MAINTAINER:=Mikhail Sadikov <info@netping.ru>
endef

define Package/np-backup/description
 NetPing-backup - conf file for sysupgrade backup and restore
endef

define Package/np-backup/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/sysupgrade.conf $(1)/etc/
endef

$(eval $(call BuildPackage,np-backup))
