#!/bin/sh
# sdhi device driver autotest shell-script

. $(dirname $0)/../../boards-conf/def_configs

DRIVER="sh_mobile_sdhi"						# sdhi driver name of renesas

SDHI_INTERRUPT_0="ee100000.sd"				# interrupt of sdhi 1
SDHI_INTERRUPT_1="ee160000.sd"				# interrupt of sdhi 2

DRIVER_PATH="SDHI"							# path driver for run test
LOGFILE="storage.txt"						# log file name


############################################################
# get device dev
# only get dev if run on board
if ifconfig | grep -i $IPBOARD > /dev/null; then
	DEVICE_PATH0=`find /sys/devices/platform/${SDHI_INTERRUPT_0}/* -name "mmcblk*" | sed -n 1p`
	DEVICE_PATH1=`find /sys/devices/platform/${SDHI_INTERRUPT_1}/* -name "mmcblk*" | sed -n 1p`
	DEVICE_SD0=`echo $DEVICE_PATH0 | tr '/' '\n' | tail -1`
	DEVICE_SD1=`echo $DEVICE_PATH1 | tr '/' '\n' | tail -1`
	DEVICE_PATH0=`find /sys/devices/platform/${SDHI_INTERRUPT_0}/* -name "mmcblk*" | sed -n 2p`
	DEVICE_PATH1=`find /sys/devices/platform/${SDHI_INTERRUPT_1}/* -name "mmcblk*" | sed -n 2p`
	DEVICE_SD0_PART1=`echo $DEVICE_PATH0 | tr '/' '\n' | tail -1`
	DEVICE_SD1_PART1=`echo $DEVICE_PATH1 | tr '/' '\n' | tail -1`

	echo "Device will be used: $DEVICE_SD0 $DEVICE_SD1 $DEVICE_SD0_PART1 $DEVICE_SD1_PART1"
fi
