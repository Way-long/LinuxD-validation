#!/bin/bash
# sata device driver autotest shell-script

set -e
#set -x

if [ $# -lt 3 ]; then
    echo "usage : $(basename $0) SOURCE_PATH DESTINATION_PATH NUMBER_STAGE HAS_DATA"
    exit 1
fi

SRC_DIR="$1"
DST_DIR="$2"
NUM_STG="$3"
HAS_DATA="$4"

if [ "$NUM_STG" -lt 1 ];then
	echo "number of stage forder less than 1. please try again"
fi

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

TEMP_DIR=""

# Make stage folder
i=1
while [ $i -le "$NUM_STG" ]
do
	TEMP_DIR="$TEMP_DIR/stage${i}"
	(( i++ ))
done

mkdir -p ${SRC_DIR}${TEMP_DIR}

echo "setting ${SRC_DIR}${TEMP_DIR} have file data 50MB"
dd if=/dev/urandom of="${SRC_DIR}${TEMP_DIR}/file-50mb" bs=1M count=50

# Write test
echo "copying ${NUM_STG} folder from ${SRC_DIR} to ${DST_DIR}"
cp -r ${SRC_DIR}/stage1 $DST_DIR

sync

if cmp ${SRC_DIR}${TEMP_DIR}/file-50mb ${DST_DIR}${TEMP_DIR}/file-50mb;then
	eval $PASS_MEG
else
	eval $FAIL_MEG
fi

# Umount src_dir and dst_dir
$(dirname $0)/../common/umount-device.sh $SRC_DIR
$(dirname $0)/../common/umount-device.sh $DST_DIR

rm -rf $SRC_DIR
rm -rf $DST_DIR