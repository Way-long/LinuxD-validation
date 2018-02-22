#!/bin/sh
# ethernet device driver autotest shell-script

set -e
#set -x

echo "\n************************** STRESS CPU TEST *****************************\n"

stress --cpu $CPU_NUMBER --io $(($CPU_NUMBER + $CPU_NUMBER)) --vm $CPU_NUMBER --vm-bytes 20M --timeout 1800s &

START=`date +%s`

echo "prepare data for test"

mkdir -p $RAM_DIR

# Mount ram
$(dirname $0)/../common/mount-device.sh $RAM_DIR

size="100"

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

while [ $(( $(date +%s) - 3600 )) -lt $START ]; do

    $(dirname $0)/ftp_put_board_to_pc_data.sh $size

done

# Umount ram
$(dirname $0)/../common/umount-device.sh $RAM_DIR

rm -rf $RAM_DIR

echo "\n************************************************************************\n"