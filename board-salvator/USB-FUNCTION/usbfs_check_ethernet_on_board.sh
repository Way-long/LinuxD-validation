#!/bin/sh
# usb function device driver autotest shell-script

set -e
#set -x

echo "checklog" > $SHELL_SOURCE_CODE/$DRIVER_PATH/loglog.txt

echo "ON BOARD:"

if ! ifconfig -a | grep $USBFS_ETHER_INTERFACE;then
    eval $FAIL_MEG
	exit 1
fi

eval $PASS_MEG