#!/bin/sh
# display unit device driver autotest shell-script

set -a
#set -x

echo "\n*****************************HDMI1 --> DU2****************************\n"

if ! modetest -M rcar-du > $LOG_DRM;then
	echo "error drm. please check again"
	eval $FAIL_MEG
	exit 1
fi

if [ -f $LOG_DRM ]
then

hdmi_id=`grep HDMI-A-2 $LOG_DRM | cut -c-3  | sed 's/[[:space:]]//g'` 

du_id=`grep CRTCs: -A 8 $LOG_DRM | tail -n 1 | cut -c-3  | sed 's/[[:space:]]//g'` 

fi

rm -rf $LOG_DRM

$(dirname $0)/du_switch_screen.sh $hdmi_id $du_id

echo "\n**********************************************************************\n"