#!/bin/sh
# ethernet device driver autotest shell-script

set -e
#set -x

echo "\n*****************TRANFERS DATA FROM BOARD TO HOST PC******************\n"

eval $MOUNT_RAM

for size in "1" "50" "350"; do

	echo "tranfer file ${size}MB"
	$(dirname $0)/ftp_put_board_to_pc_data.sh $size

done

eval $UNMOUNT_RAM

echo "\n**********************************************************************\n"
