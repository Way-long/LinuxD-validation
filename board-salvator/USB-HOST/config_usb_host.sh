#!/bin/sh
# usb device driver autotest shell-script

set -a
#set -x

. $(dirname $0)/../config.sh

# config driver usb host shell script
DRIVER="ehci-platform"						# USB2.0 driver name of renesas
USB2_CH1_INTERRUPT="ee0a0100.usb"			# interrupt of usb2.0 chanel 1
USB2_CH2_INTERRUPT="ee0c0100.usb"			# interrupt of usb2.0 chanel 2 H3
#USB2_CH2_INTERRUPT="ee080100.usb"			# interrupt of usb2.0 chanel 2 M3
USB3_INTERRUPT="ee000000.usb"				# interrupt of usb3.0	
DRIVER_PATH="USB-HOST"						# path driver for run test
LOGFILE="usb-log.txt"
############################################################
# get device dev

# only get dev if run on board
if uname -a | grep "linaro-nano" > /dev/null ;then

	#get device 
	DEVICE_PATH0=`find /sys/devices/platform/soc/${USB2_CH1_INTERRUPT}/* -name "sd*" | sed -n 1p`

	DEVICE_PATH1=`find /sys/devices/platform/soc/${USB2_CH2_INTERRUPT}/* -name "sd*" | sed -n 1p`

	DEVICE_PATH2=`find /sys/devices/platform/soc/${USB3_INTERRUPT}/* -name "sd*" | sed -n 1p`

	DEVICE_USB2C1=`echo $DEVICE_PATH0 | tr '/' '\n' | tail -1`

	DEVICE_USB2C2=`echo $DEVICE_PATH1 | tr '/' '\n' | tail -1`

	DEVICE_USB3=`echo $DEVICE_PATH2 | tr '/' '\n' | tail -1`

	DEVICE_PATH0=`find /sys/devices/platform/soc/${USB2_CH1_INTERRUPT}/* -name "sd*" | sed -n 2p`

	DEVICE_PATH1=`find /sys/devices/platform/soc/${USB2_CH2_INTERRUPT}/* -name "sd*" | sed -n 2p`

	DEVICE_PATH2=`find /sys/devices/platform/soc/${USB3_INTERRUPT}/* -name "sd*" | sed -n 2p`

	DEVICE_USB2C1_PART1=`echo $DEVICE_PATH0 | tr '/' '\n' | tail -1`

	DEVICE_USB2C2_PART1=`echo $DEVICE_PATH1 | tr '/' '\n' | tail -1`

	DEVICE_USB3_PART1=`echo $DEVICE_PATH2 | tr '/' '\n' | tail -1`
fi