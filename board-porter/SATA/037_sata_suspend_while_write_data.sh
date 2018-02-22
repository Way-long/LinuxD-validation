#!/bin/sh
# sata device driver autotest shell-script

set -e
#set -x

FILESIZE="100"
FILE_NAME="file-$FILESIZE$UNIT"

echo "`date` SDHI driver autotest start"

if ! eval $PREPARE_SUSPEND;then
	exit 1
else

mkdir -p $RAM_DIR
mkdir -p $HDD_DIR

echo "writing direct: ${RAM_NAME}->${HDD_NAME}"

# Mount src_dir and dst_dir
$(dirname $0)/../common/mount-device.sh $RAM_DIR
$(dirname $0)/../common/mount-device.sh $HDD_DIR

# write test
dd if=$SOURCE of=${RAM_DIR}/${FILE_NAME} bs=1M count=$FILESIZE

cp ${RAM_DIR}/${FILE_NAME} $HDD_DIR & sleep 2;

echo mem > /sys/power/state

sync 

cmp ${RAM_DIR}/${FILE_NAME} ${HDD_DIR}/${FILE_NAME}

# Umount src_dir and dst_dir
$(dirname $0)/../common/umount-device.sh $RAM_DIR
$(dirname $0)/../common/umount-device.sh $HDD_DIR

rm -rf $RAM_DIR/
rm -rf $HDD_DIR/