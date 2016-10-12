#!/bin/bash
# display unit device driver autotest shell-script

set -e
#set -x

if [ $# -lt 2 ]; then
    echo "usage : $(basename $0) DISPLAY_MONITOR FORLDER_NAME"
    exit 1
fi

DU_MONITOR="$1"
FLD_NAME="$2"

echo "\n Please connect $DU_MONITOR before test this item \n"

eval $RESET_COMMAND

sleep 3

mkdir -p $FLD_NAME
	
$(dirname $0)/../common/mount-device.sh $FLD_NAME

cp -f $(dirname $0)/image/${FILE_IMAGE} $FLD_NAME

if bmap $DEVICE_DU ${FLD_NAME}/${FILE_IMAGE}; then
	eval $PASS_MEG
else
	echo "can not display image" 
	eval $FAIL_MEG
fi

$(dirname $0)/../common/umount-device.sh $FLD_NAME