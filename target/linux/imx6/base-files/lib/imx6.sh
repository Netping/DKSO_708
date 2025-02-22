#!/bin/sh
#
# Copyright (C) 2010-2013 OpenWrt.org
#

IMX6_BOARD_NAME=
IMX6_MODEL=

rootpartuuid() {
	local cmdline=$(cat /proc/cmdline)
	local bootpart=${cmdline##*root=}
	bootpart=${bootpart%% *}
	local uuid=${bootpart#PARTUUID=}
	echo ${uuid%-02}
}

bootdev_from_uuid() {
	blkid | grep "PTUUID=\"$(rootpartuuid)\"" | cut -d : -f1
}

bootpart_from_uuid() {
	blkid | grep $(rootpartuuid)-01 | cut -d : -f1
}

rootpart_from_uuid() {
	blkid | grep $(rootpartuuid)-02 | cut -d : -f1
}

apalis_mount_boot() {
	mkdir -p /boot
	[ -f /boot/uImage ] || {
		mount -o rw,noatime $(bootpart_from_uuid) /boot > /dev/null
	}
}

netping_mount_boot() {
	mkdir -p /boot
	[ -f /boot/uImage ] || {
		mount -o rw,noatime /dev/mmcblk1p1 /boot > /dev/null
	}

}

netping_mount_root() {
	mkdir /rootfs
	mount -o rw,noatime /dev/mmcblk1p2 /rootfs > /dev/null

}


imx6_board_detect() {
	local machine
	local name

	machine=$(cat /proc/device-tree/model)

	case "$machine" in
	"Gateworks Ventana i.MX6 DualLite/Solo GW51XX" |\
	"Gateworks Ventana i.MX6 Dual/Quad GW51XX")
		name="gw51xx"
		;;

	"Gateworks Ventana i.MX6 DualLite/Solo GW52XX" |\
	"Gateworks Ventana i.MX6 Dual/Quad GW52XX")
		name="gw52xx"
		;;

	"Gateworks Ventana i.MX6 DualLite/Solo GW53XX" |\
	"Gateworks Ventana i.MX6 Dual/Quad GW53XX")
		name="gw53xx"
		;;

	"Gateworks Ventana i.MX6 DualLite/Solo GW54XX" |\
	"Gateworks Ventana i.MX6 Dual/Quad GW54XX" |\
	"Gateworks Ventana GW5400-A")
		name="gw54xx"
		;;

	"Gateworks Ventana i.MX6 Dual/Quad GW551X" |\
	"Gateworks Ventana i.MX6 DualLite/Solo GW551X")
		name="gw551x"
		;;

	"Gateworks Ventana i.MX6 DualLite/Solo GW552X" |\
	"Gateworks Ventana i.MX6 Dual/Quad GW552X")
		name="gw552x"
		;;

	"Gateworks Ventana i.MX6 DualLite/Solo GW553X" |\
	"Gateworks Ventana i.MX6 Dual/Quad GW553X")
		name="gw553x"
		;;

	"Gateworks Ventana i.MX6 DualLite/Solo GW5904" |\
	"Gateworks Ventana i.MX6 Dual/Quad GW5904")
		name="gw5904"
		;;

	"Gateworks Ventana i.MX6 DualLite/Solo GW5907" |\
	"Gateworks Ventana i.MX6 Dual/Quad GW5907")
		name="gw5907"
		;;

	"Gateworks Ventana i.MX6 DualLite/Solo GW5910" |\
	"Gateworks Ventana i.MX6 Dual/Quad GW5910")
		name="gw5910"
		;;

	"Gateworks Ventana i.MX6 DualLite/Solo GW5912" |\
	"Gateworks Ventana i.MX6 Dual/Quad GW5912")
		name="gw5912"
		;;

	"Gateworks Ventana i.MX6 DualLite/Solo GW5913" |\
	"Gateworks Ventana i.MX6 Dual/Quad GW5913")
		name="gw5913"
		;;

	"SolidRun Cubox-i Solo/DualLite" |\
	"SolidRun Cubox-i Dual/Quad")
		name="cubox-i"
		;;

	"Toradex Apalis iMX6Q/D Module on Ixora Carrier Board" |\
	"Toradex Apalis iMX6Q/D Module on Ixora Carrier Board V1.1")
		name="apalis,ixora"
		;;

	"Toradex Apalis iMX6Q/D Module on Apalis Evaluation Board")
		name="apalis,eval"
		;;

	"Wandboard i.MX6 Dual Lite Board")
		name="wandboard"
		;;

	"NetPing GSM Gateway 708G06")
		name="netping"
		;;

	*)
		name="generic"
		;;
	esac

	[ -z "$IMX6_BOARD_NAME" ] && IMX6_BOARD_NAME="$name"
	[ -z "$IMX6_MODEL" ] && IMX6_MODEL="$machine"

	[ -e "/tmp/sysinfo/" ] || mkdir -p "/tmp/sysinfo/"

	echo "$IMX6_BOARD_NAME" > /tmp/sysinfo/board_name
	echo "$IMX6_MODEL" > /tmp/sysinfo/model
}
