#!/bin/sh
# usb device driver autotest shell-script

set -a
#set -x

echo "\n*************SIMULATANEOUSLY COPY USB2.0 AND USB3.0************\n"

$(dirname $0)/usb_simultaneously_copy_inside_two_usb.sh $USB2_DIR $USB3_DIR 100

echo "\n***************************************************************\n"