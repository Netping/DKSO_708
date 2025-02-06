include $(TOPDIR)/rules.mk

PKG_NAME:="owrt-reports"
PKG_VERSION=0.1
PKG_REV:=5cb695ab9732106b0392bfb3ff7ae84ad5e15a58
PKG_RELEASE:=11

PKG_BUILD_DIR:=$(BUILD_DIR)/owrt-reports-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git@github.com:Netping/OWRT-reports.git
PKG_SOURCE_VERSION:=$(PKG_REV)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_REV).tar.gz

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/owrt-reports
  SECTION:=netping
  CATEGORY:=NetPing
  SUBMENU:=Base
  TITLE:=reports module
  URL:=https://github.com/Netping/OWRT_Notifications
  MAINTAINER:=Leonid Khlebushchev <info@netping.ru>
  DEPENDS:= +owrt-log +owrt-email +owrt-plib-ubus +owrt-plib-schedule
endef

define Package/owrt-reports/description
 Module for sending reports
endef

MODULE_FILE1:=reports.py
MODULE_FILE2:=Configname
MODULE_FILES_DIR:=/etc/netping/reports/

CONF_FILE:=reportsconf
CONF_DIR:=/etc/config/

RUN_SOURCE_FILE:=owrt_reports_autorun
RUN_DEST_FILE:=owrt_reports

RUN_DIR:=/etc/init.d/

ACL_FILE:=owrt-reports.json
ACL_DIR:=/usr/share/acl.d/

define Package/owrt-reports/conffiles
	$(CONF_DIR)$(CONF_FILE)
endef

define Package/owrt-reports/Configure
	chmod 640 $(1)$(ACL_DIR)$(ACL_FILE)
endef

define Package/owrt-reports/install
	$(INSTALL_DIR) $(1)$(MODULE_FILES_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/{$(MODULE_FILE1),$(MODULE_FILE2)} $(1)$(MODULE_FILES_DIR)

	$(INSTALL_DIR) $(1)$(CONF_DIR)
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/$(CONF_FILE) $(1)$(CONF_DIR)
	
	$(INSTALL_DIR) $(1)$(RUN_DIR)
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(RUN_SOURCE_FILE) $(1)$(RUN_DIR)$(RUN_DEST_FILE)

	$(INSTALL_DIR) $(1)$(ACL_DIR)
	$(CP) $(PKG_BUILD_DIR)/$(ACL_FILE) $(1)$(ACL_DIR)

endef

define Package/owrt-reports/clean
	rm -f $(1)$(CONF_DIR)$(CONF_FILE)
	rm -rf $(1)$(MODULE_FILES_DIR)
	rm -f $(1)$(ACL_DIR)$(ACL_FILE)
	rm -f $(1)$(RUN_DIR)$(RUN_DEST_FILE)
endef

$(eval $(call BuildPackage,owrt-reports))
