#!/bin/sh
# display unit device driver autotest shell-script

set -e
#set -x

if [ $# -lt 1 ]; then
    echo "usage : $(basename $0) DISPLAY_MONITOR"
    exit 1
fi

DU_MONITOR="$1"

echo "\n Please connect $DU_MONITOR before test this item \n"

eval $RESET_COMMAND

sleep 3

if ! modetest -M rcar-du > $LOG_DRM;then
	echo "error drm. please check again"
	eval $FAIL_MEG
	exit 1
fi	

if [ -f $LOG_DRM ]
then

du_id=`grep CRTCs: -A 5 $LOG_DRM | tail -n 1 | cut -c-3  | sed 's/[[:space:]]//g'` 

fi

rm -rf $LOG_DRM

for offset in "20" "80" "160" "240" "320" "400" "460"; do

    cmd="modetest -M rcar-du -P $du_id:200x200+${offset}+${offset}@AR24"
	echo $cmd

	if ! $(dirname $0)/du_restore.sh & eval $cmd;then
		echo "Can not set offset x=${offset} y=${offset}"
		eval $FAIL_MEG
		exit 1
	fi

    eval $RESET_COMMAND

    sleep 3

done

eval $PASS_MEG