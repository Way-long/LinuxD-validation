#!/bin/sh
# usb device driver autotest shell-script

set -a
#set -x

echo "\n*********************READ SPEED USB2.0 TEST********************\n"

$(dirname $0)/usb_read_speed.sh $USB2_DIR $DEVICE_USB2C1_PART1

echo "\n***************************************************************\n"