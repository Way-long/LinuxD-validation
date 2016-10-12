#!/bin/sh
# ethernet device driver autotest shell-script

set -e
#set -x

echo "\n*****************TRANFERS DATA FROM BOARD TO HOST PC******************\n"

# Mount ram
$(dirname $0)/../common/mount-device.sh $RAM_DIR

for size in "1" "50" "350"; do

	echo "tranfer file ${size}MB"
	$(dirname $0)/ftp_put_board_to_pc_data.sh $size

done

# Umount ram
$(dirname $0)/../common/umount-device.sh $RAM_DIR

echo "\n**********************************************************************\n"
