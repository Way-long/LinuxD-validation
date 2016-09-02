#!/bin/sh
# ethernet device driver autotest shell-script

set -e
#set -x

echo "\n*****************TRANFERS DATA FROM HOST PC TO BOARD******************\n"

eval $MOUNT_RAM

for size in "1" "50" "350"; do

	echo "tranfer file ${size}MB"
	$(dirname $0)/ftp_get_pc_to_board_data.sh $size

done

eval $UNMOUNT_RAM

echo "\n*********************************************************************\n"
