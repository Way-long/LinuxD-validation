#!/bin/sh
# ethernet device driver autotest shell-script

set -a
#set -x

echo "\n*************Ctr_C DURING TRANFER DATA FROM BOARD TO HOST PC**********\n"

echo "prepare data for test"

if ! [ -f "$(dirname $0)/data/file-${SIZE_DATA}mb" ]; then
	dd if=/dev/urandom of=/tmp/file-${SIZE_DATA}mb bs=1M count=${SIZE_DATA}
else
	cp $(dirname $0)/data/file-${SIZE_DATA}mb /tmp
	sync
fi

if [ -f "/tmp/file-${SIZE_DATA}mb" ];then
	echo "prepare data successfully"
else
	echo "prepare data not successfully"
	eval $FAIL_MEG
	exit 1;	
fi

mkdir -p $RAM_DIR

# Mount ram
$(dirname $0)/../common/mount-device.sh $RAM_DIR

size="350"

echo "tranfer file ${size}MB"
$(dirname $0)/ftp_put_board_to_pc_data.sh $size & sleep 10;

$(dirname $0)/../common/ctr_c.sh "ftp -inv"

sleep 5
echo "re-tranfer file ${size}MB"
$(dirname $0)/ftp_put_board_to_pc_data.sh $size

# Umount ram
$(dirname $0)/../common/umount-device.sh $RAM_DIR

rm -rf $RAM_DIR

echo "\n**********************************************************************\n"