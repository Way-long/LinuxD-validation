#!/bin/sh
# mount devices

set -e
#set -x

if [ $# -lt 3 ]; then
    echo "usage: $(basename $0) MOUNT_DIRECTORY INTERRUPT TYPE_NAME (SECOND_PARTITION)" >& 2
    echo "example $(basename $0) /mnt/sd1 ee100000.sd mmcblk*p*"
    exit 1
fi

DEV_DIR="$1"
DEV_INT="$2"
DEV_TYPE="$3"
DEV_SECOND="$4"

if [ "$DEV_SECOND" = "1" ];then
	DEVICE_PATH=`find /sys/devices/platform/soc/${DEV_INT}/* -name "${DEV_TYPE}" | sed -n 3p`
else
	DEVICE_PATH=`find /sys/devices/platform/soc/${DEV_INT}/* -name "${DEV_TYPE}" | sed -n 2p`
fi

if ! echo $DEVICE_PATH | grep "${DEV_TYPE}" > /dev/null;then
	echo "Please connect device."
	exit 1
fi

DEVICE_NAME=`echo $DEVICE_PATH | tr '/' '\n' | tail -1`

if ! echo $DEVICE_NAME | grep "${DEV_TYPE}" > /dev/null;then
	echo "Please connect device."
	exit 1
fi

if mount /dev/${DEVICE_NAME} $DEV_DIR;then
    echo "Device $DEV_DIR have mounted"
else
    echo "Device $DEV_DIR mount is error" >&2
fi
