#!/bin/sh
# usb function device driver autotest shell-script

set -e
#set -x

if [ $# -lt 1 ]; then
    echo "usage : $(basename $0) DEVICE (PARAMETTER)"
    exit 1
fi

DEVICE="$1"
PARAMETTER="$2"

if ! modprobe $DEVICE $PARAMETTER;then
	echo "modprobe device error.Please check again"
	exit 1
fi

exit 0