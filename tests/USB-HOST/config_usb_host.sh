#!/bin/sh
# usb device driver autotest shell-script

set -a
#set -x

. $(dirname $0)/../../boards-conf/def_configs

# config driver usb host shell script
DRIVER_PATH="USB-HOST"						# path driver for run test
LOGFILE="usb-log.txt"
############################################################
# get device dev

# only get dev if run on board
if ! ifconfig | grep -i $IPSERVER > /dev/null; then
	#get device 
	DEVICE_PATH0=`find /sys/devices/platform/${USB2_CH1_INTERRUPT}/* -name "sd*" | sed -n 1p`
	DEVICE_PATH1=`find /sys/devices/platform/${USB2_CH2_INTERRUPT}/* -name "sd*" | sed -n 1p`
	DEVICE_PATH2=`find /sys/devices/platform/${USB3_INTERRUPT}/* -name "sd*" | sed -n 1p`

	DEVICE_USB2C1=`echo $DEVICE_PATH0 | tr '/' '\n' | tail -1`
	DEVICE_USB2C2=`echo $DEVICE_PATH1 | tr '/' '\n' | tail -1`
	DEVICE_USB3=`echo $DEVICE_PATH2 | tr '/' '\n' | tail -1`
	echo "Device will be used: $DEVICE_USB2C1 $DEVICE_USB2C2 $DEVICE_USB3."

	DEVICE_PATH0=`find /sys/devices/platform/${USB2_CH1_INTERRUPT}/* -name "sd*" | sed -n 2p`
	DEVICE_PATH1=`find /sys/devices/platform/${USB2_CH2_INTERRUPT}/* -name "sd*" | sed -n 2p`
	DEVICE_PATH2=`find /sys/devices/platform/${USB3_INTERRUPT}/* -name "sd*" | sed -n 2p`

	DEVICE_USB2C1_PART1=`echo $DEVICE_PATH0 | tr '/' '\n' | tail -1`
	DEVICE_USB2C2_PART1=`echo $DEVICE_PATH1 | tr '/' '\n' | tail -1`
	DEVICE_USB3_PART1=`echo $DEVICE_PATH2 | tr '/' '\n' | tail -1`
	echo "Partition will be used: $DEVICE_USB2C1_PART1 $DEVICE_USB2C2_PART1 $DEVICE_USB3_PART1."
fi
