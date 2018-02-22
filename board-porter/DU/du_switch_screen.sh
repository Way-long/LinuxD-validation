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

cmd="modetest -M rcar-du -s ${DISPLAY_MONITOR}@${DU_MONITOR}:1024x768@AR24 >> $LOGFILE 2>&1"
echo $cmd

$(dirname $0)/du_restore.sh &

eval $cmd

$(dirname $0)/../common/wait_process.sh "/bin/sh ./du_restore.sh" > /dev/null

LOG=`cat $LOGFILE`

rm -rf $LOGFILE

if echo $LOG | grep "fail" > /dev/null;then
	echo "Can not change screen"
	eval $FAIL_MEG
	exit 1
fi

eval $PASS_MEG
