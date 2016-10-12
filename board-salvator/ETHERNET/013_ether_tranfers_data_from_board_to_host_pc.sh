#!/bin/sh
# ethernet device driver autotest shell-script

set -e
#set -x

echo "\n*****************TRANFERS DATA FROM BOARD TO HOST PC******************\n"

mkdir -p $RAM_DIR

# Mount ram
$(dirname $0)/../common/mount-device.sh $RAM_DIR

for size in "1" "50" "350"; do

	echo "prepare data for test"

	if ! [ -f "$(dirname $0)/data/file-${size}mb" ]; then
		dd if=/dev/urandom of=/tmp/file-${size}mb bs=1M count=${size}
	else
		cp $(dirname $0)/data/file-${size}mb /tmp
		sync
	fi

	if [ -f "/tmp/file-${size}mb" ];then
		echo "prepare data successfully"
	else
		echo "prepare data not successfully"
		eval $FAIL_MEG
		exit 1;	
	fi

	echo "tranfer file ${size}MB"
	$(dirname $0)/ftp_put_board_to_pc_data.sh $size

done

sync

# Umount ram
$(dirname $0)/../common/umount-device.sh $RAM_DIR

rm -rf $RAM_DIR

echo "\n**********************************************************************\n"
