#!/bin/bash
# usb device driver autotest shell-script

set -a
#set -x

echo "\n******************** SMP TEST MULTIPLE CPU *****************************\n"

CARD1_DIR="$USB2_DIR"
CARD2_DIR="$USB2_CH2_DIR"

mkdir -p $RAM_DIR
mkdir -p $CARD1_DIR
mkdir -p $CARD2_DIR

# Mount the device
echo "Mount the devices"
if ! $(dirname $0)/../common/mount-device.sh $RAM_DIR > /dev/null; then
    echo "Could not mount $RAM_DIR"
    eval $FAIL_MEG
    exit 1
fi

if ! $(dirname $0)/../common/mount-device.sh $CARD1_DIR > /dev/null; then
    echo "Could not mount $CARD1_DIR"
    eval $FAIL_MEG
    exit 1
fi

if ! $(dirname $0)/../common/mount-device.sh $CARD2_DIR > /dev/null; then
    echo "Could not mount $CARD2_DIR"
    eval $FAIL_MEG
    exit 1
fi

# Clear data for test
if [ "$(ls -A $CARD1_DIR)" ]; then
    rm -r $CARD1_DIR/* 
fi

# Clear data for test
if [ "$(ls -A $CARD2_DIR)" ]; then
    rm -r $CARD2_DIR/* 
fi

if [ "$(ls -A $RAM_DIR)" ]; then
    rm -r $RAM_DIR/* 
fi

$(dirname $0)/usb_taskset_multiple_cpu_multi_usb.sh $CARD1_DIR $CARD2_DIR

$(dirname $0)/../common/wait_process.sh "/bin/bash ./usb_smp_read_write_copy_one.sh"

sync

# Unmount device
if ! $(dirname $0)/../common/umount-device.sh $RAM_DIR > /dev/null; then
    echo "Could not umount the ${RAM_DIR}"
fi

if ! $(dirname $0)/../common/umount-device.sh $CARD1_DIR > /dev/null; then
    echo "Could not umount the ${CARD1_DIR}"
fi

if ! $(dirname $0)/../common/umount-device.sh $CARD2_DIR > /dev/null; then
    echo "Could not umount the ${CARD2_DIR}"
fi

# Clear data for test
if [ "$(ls -A $CARD1_DIR)" ]; then
    rm -r $CARD1_DIR/* 
fi

if [ "$(ls -A $CARD2_DIR)" ]; then
    rm -r $CARD2_DIR/* 
fi

if [ "$(ls -A $RAM_DIR)" ]; then
    rm -r $RAM_DIR/* 
fi

rm -rf $RAM_DIR
rm -rf $CARD1_DIR
rm -rf $CARD2_DIR

echo "\n************************************************************************\n"