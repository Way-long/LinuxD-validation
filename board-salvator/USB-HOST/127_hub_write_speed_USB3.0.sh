#!/bin/sh
# usb device driver autotest shell-script

set -a
#set -x

echo "\n****************HUB WRITE SPEED USB3.0 TEST********************\n"

$(dirname $0)/usb_write_speed.sh $USB3_DIR $DEVICE_USB3_PART1

echo "\n***************************************************************\n"