#!/bin/sh
# pciec device driver autotest shell-script

set -e
#set -x

echo "\n*****************TRANFERS DATA FROM HOST PC TO BOARD******************\n"

mkdir -p $RAM_DIR

# Mount ram
$(dirname $0)/../common/mount-device.sh $RAM_DIR

for size in "1" "50" "350"; do

	rm -rf $RAM_DIR/*

	echo "prepare data for test"

#check file on host pc
ftp -inv $IPSERVER > $LOGFILE 2>&1 <<END_SCRIPT

quote USER $PCNAME
quote PASS $PCPASSWORD

ls $PC_FOLDER

quit

END_SCRIPT
#---------

	if grep -i "file-${size}mb" $LOGFILE >/dev/null;then
		echo "prepare data file-${size}mb successfully"
	else
		echo "prepare data file-${size}mb not successfully please create data on host pc"
		rm -rf $LOGFILE
		eval $FAIL_MEG
		exit 1;	
	fi

	if [ -f $LOGFILE ];then
	    rm -rf $LOGFILE
	fi 

	echo "tranfer file ${size}MB"
	$(dirname $0)/ftp_get_pc_to_board_data.sh $size

done

sync

# Umount ram
$(dirname $0)/../common/umount-device.sh $RAM_DIR

rm -rf $RAM_DIR

echo "\n*********************************************************************\n"