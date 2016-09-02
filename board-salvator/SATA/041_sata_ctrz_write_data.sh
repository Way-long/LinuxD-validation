#!/bin/sh
# sata device driver autotest shell-script

set -e
#set -x

echo "\n*************************CTR+Z WRITE DATA*******************************\n"

FILESIZE="350"
FILE_NAME="file-$FILESIZE$UNIT"

CMD_NAME="cp ${RAM_DIR}/${FILE_NAME}"

mkdir -p $HDD_DIR	
mkdir -p $RAM_DIR	

#mount device to Board
$(dirname $0)/../common/mount-device.sh $RAM_DIR
$(dirname $0)/../common/mount-device.sh $HDD_DIR

echo "write file data on Board"
dd if=$SOURCE of=${RAM_DIR}/${FILE_NAME} bs=1M count=$FILESIZE

echo "wirte data to Board from SD"
cp ${RAM_DIR}/${FILE_NAME} $HDD_DIR & 

test=exec $(dirname $0)/../common/ctr_z.sh "$CMD_NAME"

if cmp ${RAM_DIR}/${FILE_NAME} ${HDD_DIR}/${FILE_NAME} ; then
    eval $PASS_MEG
else
    eval $FAIL_MEG
fi

# Umount src_dir and dst_dir
$(dirname $0)/../common/umount-device.sh $RAM_DIR
$(dirname $0)/../common/umount-device.sh $HDD_DIR

# Remove file
rm -rf $RAM_DIR
rm -rf $HDD_DIR

echo "\n************************************************************************\n"
