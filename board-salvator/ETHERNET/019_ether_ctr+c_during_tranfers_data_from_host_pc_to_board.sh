#!/bin/sh
# ethernet device driver autotest shell-script

set -a
#set -x

echo "\n*************Ctr_C DURING TRANFER DATA FROM HOST PC TO BOARD**********\n"

mkdir -p $RAM_DIR

# Mount ram
$(dirname $0)/../common/mount-device.sh $RAM_DIR

size="350"

#check file on host pc
ftp -inv $IPSERVER > $LOGFILE 2>&1 <<END_SCRIPT

quote USER $PCNAME
quote PASS $PCPASSWORD

ls $PC_FOLDER

quit

END_SCRIPT
#---------

	if grep -i "file-${size}mb" $LOGFILE >/dev/null;then
		echo "prepare data successfully"
	else
		echo "prepare data not successfully"
		eval $FAIL_MEG
		break;	
	fi

	rm -rf $LOGFILE

	echo "tranfer file ${size}MB"
	$(dirname $0)/ftp_get_pc_to_board_data.sh $size & sleep 10;

	$(dirname $0)/../common/ctr_c.sh "ftp -inv"

	sleep 5

	echo "re-tranfer file ${size}MB"
	$(dirname $0)/ftp_get_pc_to_board_data.sh $size

# Umount ram
$(dirname $0)/../common/umount-device.sh $RAM_DIR

rm -rf $RAM_DIR

echo "\n*********************************************************************\n"
