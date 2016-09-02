#!/bin/bash
# mount devices

echo "Mount devices"

set -e
#set -x

if [ $# -ne 1 ]; then
    echo "usage: $(basename $0) PATTERN" >& 2
fi

DEV_DIR="$1"

# Mount device
if [ $DEV_DIR  == "/mnt/sd0"  ]; then

    DEVICE_PATH=`find /sys/devices/platform/soc/ee100000.sd/* -name "mmcblk*p*"`
    DEVICE_NAME=`echo $DEVICE_PATH | tr '/' '\n' | tail -1`

    mount /dev/${DEVICE_NAME} /mnt/sd0/

elif [ $DEV_DIR == "/mnt/sd1" ]; then

    DEVICE_PATH=`find /sys/devices/platform/soc/ee160000.sd/* -name "mmcblk*p*"`
    DEVICE_NAME=`echo $DEVICE_PATH | tr '/' '\n' | tail -1`

    mount /dev/${DEVICE_NAME} /mnt/sd1/ 

elif [ $DEV_DIR == "/mnt/hd0" ]; then
    DEVICE_PATH=`find /sys/devices/platform/soc/ee100000.sd/* -name "sda*"`
    DEVICE_NAME=`echo $DEVICE_PATH | tr '/' '\n' | tail -1`

    mount /dev/${DEVICE_NAME} /mnt/hd0/

elif [ $DEV_DIR == "/mnt/hd1" ]; then
    mount /dev/sda2 /mnt/hd1/
    
elif [ $DEV_DIR == "/mnt/usb2" ]; then
    DEVICE_PATH=`find /sys/devices/platform/soc/ee0a0100.usb/* -name "sd*"`
    DEVICE_NAME=`echo $DEVICE_PATH | tr '/' '\n' | tail -1`
    
    mount /dev/${DEVICE_NAME} /mnt/usb2/

elif [ $DEV_DIR == "/mnt/usb2c2" ]; then

    DEVICE_PATH=`find /sys/devices/platform/soc/ee0c0100.usb/* -name "sd*"`
    DEVICE_NAME=`echo $DEVICE_PATH | tr '/' '\n' | tail -1`
    echo $DEVICE_NAME
    mount /dev/${DEVICE_NAME} /mnt/usb2c2/

elif [ $DEV_DIR == "/mnt/usb3" ]; then
    mount /dev/sdb1 /mnt/usb3/
elif [ $DEV_DIR == "/mnt/qspi" ]; then
    mount /dev/mtdblock2 /mnt/qspi/
else
    mount -t tmpfs -o size=450M tmpfs /tmp/temp/
fi

# Mount check
if [ $? -eq 0 ];then
    echo "Device $DEV_DIR have mounted"
else
    echo "Device $DEV_DIR mount is error" >&2
fi
