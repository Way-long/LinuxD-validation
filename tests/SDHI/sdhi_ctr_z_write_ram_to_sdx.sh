#!/bin/sh
# sdhi device driver autotest shell-script

set -e
#set -x

if [ $# -lt 1 ]; then
    echo "usage : $(basename $0) SDHI_DIRECTORY"
    exit 1
fi

SRC_DIR="$1"
SIZE="350"

FILE_NAME="file-$SIZE$UNIT"

CMD_NAME="cp ${RAM_DIR}/${FILE_NAME}"

mkdir -p $SRC_DIR	
mkdir -p $RAM_DIR	

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

# make data for test
echo "Please wait while program make data on RAM"
if ! dd if=/dev/urandom of=${RAM_DIR}/${FILE_NAME} bs=1M count=$SIZE ;then
    echo "Prepare the data on $RAM_DIR failed"
    eval $FAIL_MEG
    exit 1
fi

# Confirm file after created
if ! [ -f ${RAM_DIR}/${FILE_NAME} ];then
    echo "${RAM_DIR}/${FILE_NAME} not exited"
    eval $FAIL_MEG
    exit 1
fi 

echo "write data to Board from SD"
cp ${RAM_DIR}/${FILE_NAME} $SRC_DIR & 

sleep 3

test=exec $(dirname $0)/../common/ctr_z.sh "$CMD_NAME"

# Confirm data
echo "Confirm the copied data"
if ! cmp ${RAM_DIR}/${FILE_NAME} $SRC_DIR/${FILE_NAME}; then
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