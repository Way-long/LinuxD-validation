#!/bin/sh
# usb function device driver autotest shell-script

set -e
#set -x

if [ $# -lt 3 ]; then
    echo "usage : $(basename $0) SOURCE_PATH DESTINATION_PATH FILE_SIZE (HAS_DATA)"
    exit 1
fi

SRC_DIR="$1"
DST_DIR="$2"
FILE_SIZE="$3"
HAS_DATA="$4"

echo "writing direct: ${SRC_DIR}->${DST_DIR}"

# Setting HD0 have data
if [ "$HAS_DATA" = "1" ];then
	echo "setting $SRC_DIR have file data 50MB"
	dd if=/dev/urandom of="$SRC_DIR/file-50mb" bs=1M count=50
fi

# Prepare data for test
cmd="dd if=/dev/urandom of='$SRC_DIR/file-${FILE_SIZE}mb' bs=1M count=${FILE_SIZE}"
echo $cmd

if ! eval $cmd ;then
	echo "Prepare data error"
	eval $FAIL_MEG
	exit 1
fi

# Copy data
echo "copying ${FILE_SIZE}M file from ${SRC_DIR} to ${DST_DIR}"

cmd="cp $SRC_DIR/file-${FILE_SIZE}mb $DST_DIR"
echo $cmd

if ! eval $cmd ;then
	echo "Copy data error"
	eval $FAIL_MEG
	exit 1
fi

sync

# Compare data after copy
cmd="cmp $SRC_DIR/file-${FILE_SIZE}mb $DST_DIR/file-${FILE_SIZE}mb"
echo $cmd

if ! eval $cmd ;then
	echo "Compare data error"
	eval $FAIL_MEG
	exit 1
fi

eval $PASS_MEG
	