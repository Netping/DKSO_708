#
# Copyright (C) 2010-2015 OpenWrt.org
#

. /lib/imx6.sh

RAMFS_COPY_BIN='blkid jffs2reset'

enable_image_metadata_check() {
	case "$(board_name)" in
		apalis*)
			REQUIRE_IMAGE_METADATA=1
			;;
	esac
}
enable_image_metadata_check

apalis_copy_config() {
	apalis_mount_boot
	cp -af "$UPGRADE_BACKUP" "/boot/$BACKUP_FILE"
	sync
	umount /boot
}

apalis_do_upgrade() {
	apalis_mount_boot
	get_image "$1" | tar Oxf - sysupgrade-apalis/kernel > /boot/uImage
	get_image "$1" | tar Oxf - sysupgrade-apalis/root > $(rootpart_from_uuid)
	sync
	umount /boot
}

netping_copy_config() {
	netping_mount_root
	cp -af "$UPGRADE_BACKUP" "/rootfs/$BACKUP_FILE"
	sync
	umount /rootfs
}

netping_do_upgrade() {
	netping_mount_boot
	get_image "$1" | tar Oxf - sysupgrade-netping/kernel > /boot/uImage
	sync
	umount /boot

	netping_mount_root
	get_image "$1" | tar Oxf - sysupgrade-netping/root.tar.gz | tar xzf - -C /rootfs
	sync
	umount /rootfs
}



platform_check_image() {
	local board=$(board_name)

	case "$board" in
	apalis*)
		return 0
		;;
	*gw5*)
		nand_do_platform_check $board $1
		return $?;
		;;
	netping)
		return 0
		;;
	esac

	echo "Sysupgrade is not yet supported on $board."
	return 1
}

platform_do_upgrade() {
	local board=$(board_name)

	case "$board" in
	apalis*)
		  apalis_do_upgrade "$1"
		;;
	*gw5*)
		nand_do_upgrade "$1"
		;;
	netping)
		netping_do_upgrade "$1"
		;;
	esac
}

platform_copy_config() {
	local board=$(board_name)

	case "$board" in
	apalis*)
		apalis_copy_config
		;;
	netping*)
		netping_copy_config
		;;
	esac
}

platform_pre_upgrade() {
	local board=$(board_name)

	case "$board" in
	apalis*)
		[ -z "$UPGRADE_BACKUP" ] && {
			jffs2reset -y
			umount /overlay
		}
		;;
	esac
}
