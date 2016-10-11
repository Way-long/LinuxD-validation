#!/bin/sh
# usb device driver autotest shell-script

set -a
#set -x

. $(dirname $0)/../config.sh

# config driver ethernet shell script
DRIVER="ehci-platform"						# USB2.0 driver name of renesas
USB2_CH1_INTERRUPT="ee0a0100.usb"			# interrupt of usb2.0 chanel 1
USB2_CH2_INTERRUPT="ee0c0100.usb"			# interrupt of usb2.0 chanel 2
USB3_INTERRUPT="ee000000.usb"				# interrupt of usb3.0	
DRIVER_PATH="USB-HOST"						# path driver for run test

############################################################
# get device dev

# only get dev if run on board
if uname -a | grep "linaro-nano" > /dev/null ;then

	DEVICE_PATH0=`find /sys/devices/platform/soc/${USB2_CH1_INTERRUPT}/* -name "mmcblk*" | sed -n 1p`

	DEVICE_PATH1=`find /sys/devices/platform/soc/${USB2_CH2_INTERRUPT}/* -name "mmcblk*" | sed -n 1p`

	DEVICE_PATH2=`find /sys/devices/platform/soc/${USB3_INTERRUPT}/* -name "mmcblk*" | sed -n 1p`

	DEVICE_USB2C1=`echo $DEVICE_PATH0 | tr '/' '\n' | tail -1`

	DEVICE_USB2C2=`echo $DEVICE_PATH1 | tr '/' '\n' | tail -1`

	DEVICE_USB3=`echo $DEVICE_PATH2 | tr '/' '\n' | tail -1`

fi