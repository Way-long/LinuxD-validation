#!/bin/bash
# usb function device driver autotest shell-script

set -e
#set -x

cmd="ifconfig usb0 $IP_ADDRESS_BOARD broadcast $USBFS_BROAD_CAST up"
echo $cmd
if ! eval $cmd;then
	echo "setting ip address for Board error"
	eval $FAIL_MEG
	exit 1
fi	