#!/bin/sh
# display unit device driver autotest shell-script

set -a
#set -x

if [ $# -lt 2 ]; then
    echo "usage : $(basename $0) DISPLAY_MONITOR(HDMI,VGA) DU_MONITOR"
    exit 1
fi

DISPLAY_MONITOR="$1"
DU_MONITOR="$2"

eval $RESET_COMMAND

sleep 3

for offset in "20" "150" "250" "668"; do

    cmd="modetest -M rcar-du -d -s ${DISPLAY_MONITOR}@${DU_MONITOR}:1024x768@XR24 -P ${DU_MONITOR}:400x200+${offset}+${offset}@XR24 >> $LOGFILE 2>&1"
    echo $cmd

    $(dirname $0)/du_restore.sh &

    eval $cmd

    LOG=`cat $LOGFILE`

    rm -rf $LOGFILE

    if echo $LOG | grep "fail" > /dev/null;then
        echo "Can not change layer position x=${offset} y=${offset}"
        eval $FAIL_MEG
        exit 1
    fi

    eval $RESET_COMMAND

    sleep 3

done

eval $PASS_MEG