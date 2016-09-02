#!/bin/sh
# display unit device driver autotest shell-script

set -e
#set -x

echo "\n*****************CHANGE LAYER POSITION HDMI1 --> DU2******************\n"

if ! modetest -M rcar-du > $LOG_DRM;then
    echo "error drm. please check again"
    eval $FAIL_MEG
    exit 1
fi

if [ -f $LOG_DRM ]
then

rgb_id=`grep VGA-1 $LOG_DRM | cut -c-3  | sed 's/[[:space:]]//g'` 

du_id=`grep CRTCs: -A 11 $LOG_DRM | tail -n 1 | cut -c-3  | sed 's/[[:space:]]//g'` 

fi

rm -rf $LOG_DRM

$(dirname $0)/du_change_layer_position_screen.sh $rgb_id $du_id

echo "\n**********************************************************************\n"