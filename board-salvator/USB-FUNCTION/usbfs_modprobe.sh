#!/bin/bash
# usb function device driver autotest shell-script

set -e
#set -x

if [ $# -lt 1 ]; then
    echo "usage : $(basename $0) DEVICE"
    exit 1
fi

DEVICE="$1"

if ! modprobe $DEVICE;then
	echo "modprobe device error"
	eval $FAIL_MEG
	exit 1
fi

exit 0