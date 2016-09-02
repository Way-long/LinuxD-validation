#!/bin/bash
# usb function device driver autotest shell-script

set -e
#set -x

if [ $# -lt 1 ]; then
    echo "usage : $(basename $0) DEVICE"
    exit 1
fi

DEVICE="$1"

if ! rmmod $DEVICE;then
	echo "rmmod device error"
	exit 1
fi

exit 0