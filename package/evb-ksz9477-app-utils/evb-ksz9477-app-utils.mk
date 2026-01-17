################################################################################
#
# EVB-KSZ9477 app_utils
#
################################################################################

EVB_KSZ9477_APP_UTILS_VERSION = v1.1.2
EVB_KSZ9477_APP_UTILS_SITE = $(call github,Microchip-Ethernet,EVB-KSZ9477,$(EVB_KSZ9477_APP_UTILS_VERSION))

# regs_bin
ifeq ($(BR2_PACKAGE_EVB_KSZ9477_APP_UTILS_REGS_BIN),y)
define EVB_KSZ9477_APP_UTILS_BUILD_CMDS_REGS_BIN
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/KSZ/app_utils/regs_bin CROSS_COMPILE=$(TARGET_CROSS)
endef
define EVB_KSZ9477_APP_UTILS_INSTALL_TARGET_CMDS_REGS_BIN
	$(INSTALL) -D -m 775 $(@D)/KSZ/app_utils/regs_bin/regs_bin $(TARGET_DIR)/usr/bin
endef
endif

# ptp_cli
ifeq ($(BR2_PACKAGE_EVB_KSZ9477_APP_UTILS_PTP_CLI),y)
define EVB_KSZ9477_APP_UTILS_BUILD_CMDS_PTP_CLI
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/KSZ/app_utils/ptp_cli CROSS_COMPILE=$(TARGET_CROSS)
endef
define EVB_KSZ9477_APP_UTILS_INSTALL_TARGET_CMDS_PTP_CLI
	$(INSTALL) -D -m 775 $(@D)/KSZ/app_utils/ptp_cli/ptp_cli $(TARGET_DIR)/usr/bin
	$(INSTALL) -D -m 775 $(@D)/KSZ/app_utils/ptp_cli/mrp_cli $(TARGET_DIR)/usr/bin
endef
endif

define EVB_KSZ9477_APP_UTILS_BUILD_CMDS
	$(EVB_KSZ9477_APP_UTILS_BUILD_CMDS_REGS_BIN)
	$(EVB_KSZ9477_APP_UTILS_BUILD_CMDS_PTP_CLI)
endef

define EVB_KSZ9477_APP_UTILS_INSTALL_TARGET_CMDS
	$(EVB_KSZ9477_APP_UTILS_INSTALL_TARGET_CMDS_REGS_BIN)
	$(EVB_KSZ9477_APP_UTILS_INSTALL_TARGET_CMDS_PTP_CLI)
endef

$(eval $(generic-package))
