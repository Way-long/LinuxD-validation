#!/bin/sh
# sata device driver autotest shell-script

set -e
#set -x

echo "\n*************************CTR+C WRITE DATA*******************************\n"

FILESIZE="300"
FILE_NAME="file-$FILESIZE$UNIT"

CMD_NAME="cp ${RAM_DIR}/${FILE_NAME}"

mkdir -p $HDD_DIR	
mkdir -p $RAM_DIR	

# Mount device to Board
$(dirname $0)/../common/mount-device.sh $RAM_DIR
$(dirname $0)/../common/mount-device.sh $HDD_DIR

echo "write file data on Board"
dd if=$SOURCE of=${RAM_DIR}/${FILE_NAME} bs=1M count=$FILESIZE

echo "wirte data to Board from SD"
cp ${RAM_DIR}/${FILE_NAME} $HDD_DIR & sleep 1; #don't repair sleep 1 second

$(dirname $0)/../common/ctr_c.sh "$CMD_NAME"

sleep 1
rm -rf $RAM_DIR/*
rm -rf $HDD_DIR/*

# write test
echo "recopy ${FILESIZE}M file from $RAM_DIR to $HDD_DIR"
$(dirname $0)/../common/write-common.sh \
         $RAM_DIR $HDD_DIR 1M ${FILESIZE}

# Umount src_dir and dst_dir
$(dirname $0)/../common/umount-device.sh $RAM_DIR
$(dirname $0)/../common/umount-device.sh $HDD_DIR

# Remove file
rm -rf $RAM_DIR
rm -rf $HDD_DIR

echo "\n************************************************************************\n"