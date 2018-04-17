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

for resolution in "640x480" "720x400" "800x600" "1024x768" "1152x864" "1280x1024" "1920x1080"; do

    cmd="modetest -M rcar-du -s ${DISPLAY_MONITOR}@${DU_MONITOR}:${resolution}@AR24 >> $LOGFILE 2>&1"
    echo $cmd

    $(dirname $0)/du_restore.sh &

    eval $cmd

    LOG=`cat $LOGFILE`

    rm -rf $LOGFILE

    if echo $LOG | grep "fail" > /dev/null;then
        echo "Can not change screen resolution ${resolution}"
        eval $FAIL_MEG
        exit 1
    fi

    eval $RESET_COMMAND

    sleep 3
done 

eval $PASS_MEG
