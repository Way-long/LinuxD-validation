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
        mount /dev/mmcblk0p1 /mnt/sd0/
elif [ $DEV_DIR == "/mnt/mmc" ]; then
        mount /dev/mmcblk0p1 /mnt/mmc/
elif [ $DEV_DIR == "/mnt/sd1" ]; then
        mount /dev/mmcblk1p1 /mnt/sd1/        
elif [ $DEV_DIR == "/mnt/sd2" ]; then
        mount /dev/mmcblk2p1 /mnt/sd2/
elif [ $DEV_DIR == "/mnt/hd0" ]; then
        mount /dev/sda1 /mnt/hd0/
elif [ $DEV_DIR == "/mnt/hd1" ]; then
        mount /dev/sda2 /mnt/hd1/
elif [ $DEV_DIR == "/mnt/usb2" ]; then
        mount /dev/sda1 /mnt/usb2/
elif [ $DEV_DIR == "/mnt/usb3" ]; then
        mount /dev/sdb1 /mnt/usb3/
elif [ $DEV_DIR == "/mnt/hdd" ]; then
        mount /dev/sda1 /mnt/hdd/
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
