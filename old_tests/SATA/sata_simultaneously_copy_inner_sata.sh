#!/bin/sh
# sata device driver autotest shell-script

set -a
#set -x

if [ $# -lt 3 ]; then
    echo "usage : $(basename $0) SRC_DIRECTORY DST_DIRECTORY FILE_SIZE"
    exit 1
fi

SRC_DIR="$1"
DST_DIR="$2"

SIZE="$3"
FILE_NAME="file-$SIZE$UNIT"

mkdir -p $SRC_DIR
mkdir -p $DST_DIR

# Mount the device
echo "Mount the devices on rootfs..."
if ! $(dirname $0)/../common/mount-device.sh $DST_DIR > /dev/null; then
    echo "Could not mount $DST_DIR"
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

if [ "$(ls -A $DST_DIR)" ]; then
    rm -r $DST_DIR/* 
fi

# Make data for test
echo "Please wait while program make data on $SRC_DIR and $DST_DIR..."

if ! dd if=/dev/urandom of=${DST_DIR}/${FILE_NAME}-DST bs=1M count=$SIZE ;then
    echo "Prepare the data on $DST_DIR failed"
    eval $FAIL_MEG
    exit 1
fi

if ! dd if=/dev/urandom of=${SRC_DIR}/${FILE_NAME}-SRC bs=1M count=$SIZE ;then
    echo "Prepare the data on $SRC_DIR failed"
    eval $FAIL_MEG
    exit 1
fi

sync;

# Check data after created
if ! [ -f ${DST_DIR}/${FILE_NAME}-DST ];then
    echo "${DST_DIR}/${FILE_NAME}-DST not exited"
    eval $FAIL_MEG
    exit 1
fi    

if ! [ -f ${SRC_DIR}/${FILE_NAME}-SRC ];then
    echo "${SRC_DIR}/${FILE_NAME}-SRC not exited"
    eval $FAIL_MEG
    exit 1
fi 

sync;

# copy data
echo "simultaneously copy data"
cp ${DST_DIR}/${FILE_NAME}-DST $SRC_DIR & cp ${SRC_DIR}/${FILE_NAME}-SRC $DST_DIR

sync;

# confirm data
echo "Confirm the copied data"

if ! cmp ${DST_DIR}/${FILE_NAME}-DST $SRC_DIR/${FILE_NAME}-DST; then
    eval $FAIL_MEG
    exit 1
fi

if ! cmp ${DST_DIR}/${FILE_NAME}-SRC $SRC_DIR/${FILE_NAME}-SRC; then
    eval $FAIL_MEG
    exit 1
fi

eval $PASS_MEG

# unmount  device
if ! $(dirname $0)/../common/umount-device.sh $DST_DIR > /dev/null; then
    echo "Could not umount the ${DST_DIR}"
fi

if ! $(dirname $0)/../common/umount-device.sh $SRC_DIR > /dev/null; then
    echo "Could not umount the ${SRC_DIR}"
fi

# Clear data for test
if [ "$(ls -A $SRC_DIR)" ]; then
    rm -r $SRC_DIR/* 
fi

if [ "$(ls -A $DST_DIR)" ]; then
    rm -r $DST_DIR/* 
fi

sync