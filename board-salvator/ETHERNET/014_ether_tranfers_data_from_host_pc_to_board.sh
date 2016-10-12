#!/bin/sh
# ethernet device driver autotest shell-script

set -e
#set -x

echo "\n*****************TRANFERS DATA FROM HOST PC TO BOARD******************\n"

mkdir -p $RAM_DIR

# Mount ram
$(dirname $0)/../common/mount-device.sh $RAM_DIR

for size in "1" "50" "350"; do

	rm -rf $RAM_DIR/*

	df

	echo "tranfer file ${size}MB"
	$(dirname $0)/ftp_get_pc_to_board_data.sh $size

done

# Umount ram
$(dirname $0)/../common/umount-device.sh $RAM_DIR

rm -rf $RAM_DIR

echo "\n*********************************************************************\n"
