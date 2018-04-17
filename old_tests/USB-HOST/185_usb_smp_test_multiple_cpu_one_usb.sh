#!/bin/bash
# usb device driver autotest shell-script

set -a
#set -x

echo "\n******************** SMP TEST MULTIPLE CPU *****************************\n"

SRC_DIR="$USB2_DIR"

mkdir -p $RAM_DIR
mkdir -p $SRC_DIR

# Mount the device
echo "Mount the devices"
if ! $(dirname $0)/../common/mount-device.sh $RAM_DIR > /dev/null; then
    echo "Could not mount $RAM_DIR"
    eval $FAIL_MEG
    exit 1
fi

if ! $(dirname $0)/../common/mount-device.sh $SRC_DIR > /dev/null; then
    echo "Could not mount $SRC_DIR"
    eval $FAIL_MEG
    exit 1
fi

# Clear data for test
if [ "$(ls -A $SRC_DIR)" ]; then
    rm -r $SRC_DIR/* 
fi

if [ "$(ls -A $RAM_DIR)" ]; then
    rm -r $RAM_DIR/* 
fi

$(dirname $0)/usb_taskset_multiple_cpu_one_usb.sh $SRC_DIR

$(dirname $0)/../common/wait_process.sh "/bin/bash ./usb_smp_read_write_copy_one.sh"

sync

sleep 60

# Unmount device
if ! $(dirname $0)/../common/umount-device.sh $RAM_DIR > /dev/null; then
    echo "Could not umount the ${RAM_DIR}"
fi
if ! $(dirname $0)/../common/umount-device.sh $SRC_DIR > /dev/null; then
    echo "Could not umount the ${SRC_DIR}"
fi

# Clear data for test
if [ "$(ls -A $SRC_DIR)" ]; then
    rm -r $SRC_DIR/* 
fi

if [ "$(ls -A $RAM_DIR)" ]; then
    rm -r $RAM_DIR/* 
fi

rm -rf $RAM_DIR
rm -rf $SRC_DIR

echo "\n************************************************************************\n"