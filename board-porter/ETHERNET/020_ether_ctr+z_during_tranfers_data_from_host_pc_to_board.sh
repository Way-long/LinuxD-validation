#!/bin/sh
# ethernet device driver autotest shell-script

set -a
#set -x

echo "\n*************Ctr_Z DURING TRANFER DATA FROM BOARD TO HOST PC**********\n"

mkdir -p $RAM_DIR

# Mount ram
$(dirname $0)/../common/mount-device.sh $RAM_DIR

size="350"

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
	echo "prepare data successfully"
else
	echo "prepare data not successfully please create data on host pc"
	rm -rf $LOGFILE
	eval $FAIL_MEG
	exit 1;	
fi

if [ -f $LOGFILE ];then
    rm -rf $LOGFILE
fi

echo "tranfer file ${size}MB"
$(dirname $0)/ftp_get_pc_to_board_data.sh $size & sleep 10;

$(dirname $0)/../common/ctr_z.sh "ftp -inv"

sync

# Umount ram
$(dirname $0)/../common/umount-device.sh $RAM_DIR

rm -rf $RAM_DIR

echo "\n**********************************************************************\n"