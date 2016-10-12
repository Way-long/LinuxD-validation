#!/bin/bash
# sata device driver autotest shell-script

set -e
#set -x

if [ $# -lt 3 ]; then
    echo "usage : $(basename $0) SOURCE_PATH DESTINATION_PATH FILE_SIZE HAS_DATA"
    exit 1
fi

SRC_DIR="$1"
DST_DIR="$2"
FILE_SIZE="$3"
HAS_DATA="$4"

mkdir -p $SRC_DIR
mkdir -p $DST_DIR

echo "writing direct: ${SRC_DIR}->${DST_DIR}"

# Mount src_dir and dst_dir
$(dirname $0)/../common/mount-device.sh $SRC_DIR
$(dirname $0)/../common/mount-device.sh $DST_DIR

#Setting HD0 have data
if [ "$HAS_DATA" = "1" ];then
	echo "setting $SRC_DIR have file data 50MB"
	dd if=/dev/urandom of="$SRC_DIR/file-50mb" bs=1M count=50
fi

# Write test
echo "copying ${FILE_SIZE}M file from ${SRC_DIR} to ${DST_DIR}"
$(dirname $0)/../common/write-common.sh \
        $SRC_DIR $DST_DIR 1M ${FILE_SIZE}

sync

sleep 10

# Umount src_dir and dst_dir
$(dirname $0)/../common/umount-device.sh $SRC_DIR
$(dirname $0)/../common/umount-device.sh $DST_DIR

rm -rf $SRC_DIR
rm -rf $DST_DIR
