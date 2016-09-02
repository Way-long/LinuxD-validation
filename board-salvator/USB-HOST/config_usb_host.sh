#!/bin/sh
# usb device driver autotest shell-script

set -a
#set -x

. $(dirname $0)/../config.sh

# config driver ethernet shell script
DRIVER="ehci-platform"						# USB2.0 driver name of renesas
USB2_CH1_INTERRUPT="ee0a0100.usb"			# interrupt of usb2.0
USB2_CH2_INTERRUPT="ee0c0100.usb"			# interrupt of usb2.0
USB3_INTERRUPT=""							# interrupt of usb3.0	
DRIVER_PATH="USB-HOST"						# path driver for run test