#!/bin/bash
# sata device driver autotest shell-script

set -a
#set -x

if [ $# -lt 2 ]; then
    echo "usage : $(basename $0) SATA_DIRECTORY FILE_SIZE"
    exit 1
fi

SRC_DIR="$1"

SIZE="$2"
FILE_NAME="file-$SIZE$UNIT"

mkdir -p $SRC_DIR
mkdir -p $RAM_DIR

# Mount the device
echo "Mount the devices on rootfs..."
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

# make data for test
echo "Please wait while program make data on RAM and $SRC_DIR..."
if ! dd if=/dev/urandom of=${RAM_DIR}/${FILE_NAME}-RAM bs=1M count=$SIZE ;then
    echo "Prepare the data on $RAM_DIR failed"
    eval $FAIL_MEG
    exit 1
fi

if ! dd if=/dev/urandom of=${SRC_DIR}/${FILE_NAME}-SRC bs=1M count=$SIZE ;then
    echo "Prepare the data on $SRC_DIR failed"
    eval $FAIL_MEG
    exit 1
fi

sync;

# Confirm file after created
if ! [ -f ${RAM_DIR}/${FILE_NAME}-RAM ];then
    echo "${RAM_DIR}/${FILE_NAME}-RAM not exited"
    eval $FAIL_MEG
    exit 1
fi    

if ! [ -f ${SRC_DIR}/${FILE_NAME}-SRC ];then
    echo "${SRC_DIR}/${FILE_NAME}-SRC not exited"
    eval $FAIL_MEG
    exit 1
fi 

# Copy data
echo "simultaneously copy data"
cp ${RAM_DIR}/${FILE_NAME}-RAM $SRC_DIR & cp ${SRC_DIR}/${FILE_NAME}-SRC $RAM_DIR

sync;

# Confirm data
echo "Confirm the copied data"
if ! cmp ${RAM_DIR}/${FILE_NAME}-RAM $SRC_DIR/${FILE_NAME}-RAM; then
    eval $FAIL_MEG
    exit 1
fi

if ! cmp ${RAM_DIR}/${FILE_NAME}-SRC $SRC_DIR/${FILE_NAME}-SRC; then
    eval $FAIL_MEG
    exit 1
fi

eval $PASS_MEG

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

sync