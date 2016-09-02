#!/bin/sh
# usb device driver autotest shell-script

set -a
#set -x

echo "\n*****************SIMULATANEOUSLY COPY RAM TO USB2.0************\n"

$(dirname $0)/usb_simultaneously_copy_inside_two_usb.sh $RAM_DIR $USB2_DIR 200

echo "\n***************************************************************\n"