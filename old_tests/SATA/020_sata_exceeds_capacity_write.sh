#!/bin/sh
# this program is run in /root. Please login /root with 'su' command

set -e
#set -x

SIZE_FILE_LOG="filesize.log"
SIZE="100"
FILE_NAME="/file-$SIZE$UNIT"

mkdir -p $HDD_DIR
mkdir -p $RAM_DIR

# Mount the storage of ram, hd to rootfs
echo "Mount RAM and $HDD_DIR on rootfs..."
$(dirname $0)/../common/mount-device.sh $RAM_DIR 
$(dirname $0)/../common/mount-device.sh $HDD_DIR 

echo "Please wait while program make data on RAM..."
# Make a data file on ram:
if ! $(dirname $0)/../common/read_write_data.py $SOURCE $RAM_DIR \
	$SIZE $LOGFILE; then
	echo "Prepare the data on RAM failed"
	exit 1
fi
# To ensure that the written data has been prepared.
sync; echo 3 > /proc/sys/vm/drop_caches

COPIED_SIZE=$SIZE
TIMES=0
echo "Copying the data to $SD_NAME0 from RAM..."
while [ $COPIED_SIZE -ne 0 ]
do
	TIMES=$(($TIMES + 1))
	if $(dirname $0)/../common/read_write.py $RAM_DIR$FILE_NAME \
	$HDD_DIR$FILE_NAME$TIMES $SIZE $LOGFILE; then
		CONF_SIZE=`du -h $HDD_DIR$FILE_NAME$TIMES`
		for size in $CONF_SIZE
		do
			echo "$size" > $SIZE_FILE_LOG
			break	
		done
		if cat $SIZE_FILE_LOG | grep "K" > /dev/null || \
		   cat $SIZE_FILE_LOG | grep "M" > /dev/null || \
		   cat $SIZE_FILE_LOG | grep "G" > /dev/null;then
			COPIED_SIZE=$SIZE
		else
			COPIED_SIZE=0
		fi
		
		sync; echo 3 > /proc/sys/vm/drop_caches
	else
		echo "Could not copy a data with size $SIZE"
		exit 1
	fi
done

sleep 1
if cat $LOGFILE | grep "No space left on device" > /dev/null; then
	echo "The space on device is full"
	echo "TEST PASSED"
else
	echo "TEST FAILED"
fi

# Clean before finish work
if ! rm -r $HDD_DIR/*; then
        echo "Could not remove data from $HDD_DIR" 
        exit 1
fi

$(dirname $0)/../common/umount-device.sh $RAM_DIR
$(dirname $0)/../common/umount-device.sh $HDD_DIR

if ! rm -r $LOGFILE; then
        echo "Could not remove $LOGFILE" 
        exit 1
fi

if ! rm -r $SIZE_FILE_LOG; then
        echo "Could not remove $SIZE_FILE_LOG" 
        exit 1
fi

if ! rm -rf $RAM_DIR; then
        echo "Could not remove $RAM_DIR" 
        exit 1
fi

if ! rm -rf $HDD_DIR; then
        echo "Could not remove $HDD_DIR" 
        exit 1
fi
