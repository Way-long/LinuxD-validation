#!/bin/sh
# pciec device driver autotest shell-script

set -a
#set -x

echo "\n*************Ctr_Z DURING TRANFER DATA FROM BOARD TO HOST PC**********\n"

mkdir -p $RAM_DIR

# Mount ram
$(dirname $0)/../common/mount-device.sh $RAM_DIR

size="350"

echo "prepare data for test"

if ! [ -f "$(dirname $0)/data/file-${size}mb" ]; then
	dd if=/dev/urandom of=${RAM_DIR}/file-${size}mb bs=1M count=${size}
else
	cp $(dirname $0)/data/file-${size}mb $RAM_DIR/
	sync
fi

if [ -f "${RAM_DIR}/file-${size}mb" ];then
	echo "prepare data successfully"
else
	echo "prepare data not successfully"
	eval $FAIL_MEG
	exit 1;	
fi

echo "tranfer file ${size}MB"
$(dirname $0)/ftp_put_board_to_pc_data.sh $size & sleep 10;

$(dirname $0)/../common/ctr_z.sh "ftp -inv"

sync

# Umount ram
$(dirname $0)/../common/umount-device.sh $RAM_DIR

rm -rf $RAM_DIR

echo "\n**********************************************************************\n"