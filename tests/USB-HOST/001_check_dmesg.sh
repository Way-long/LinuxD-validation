#!/bin/sh
# usb device driver autotest shell-script

set -e
#set -x

echo "\n***************CHECK DMESG AFTER START THE BOARD***************\n"

$(dirname $0)/../common/dmesg-multiple.sh "${USB2_CH1_INTERRUPT}" "${USB2_CH2_INTERRUPT}" "${USB3_INTERRUPT}"

echo "\n***************************************************************\n"
