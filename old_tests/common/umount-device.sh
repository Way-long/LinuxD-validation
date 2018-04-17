#!/bin/bash
# umount devices

echo "umount devices"

set -e
#set -x

if [ $# -ne 1 ]; then
        echo "usage: $(basename $0) PATTERN" >& 2
fi

DEV_DIR="$1"

# umount device
if [ "$DEV_DIR" == "$RAM_DIR" ];then
	while(true)
	do
		sleep 1
		if ! df | grep "$RAM_DIR" > /dev/null;then 
			break;
		fi
		umount $RAM_DIR		
	done
else
	
	if umount ${DEV_DIR};then
	    echo "Device $DEV_DIR have umounted"
	else
	    echo "Device $DEV_DIR umount is error" >&2
	fi

fi