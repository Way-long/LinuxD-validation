#!/bin/bash
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

get_counter_interrupt () {

    words=(`exec $(dirname $0)/../common/proc-interrupts-quiet.sh "$DU_INTERRUPT"`)

    echo ${words[1]}    
}

# CMT interrupt test
INT_1=$( get_counter_interrupt )
echo "before interrupt: $INT_1"

if ! $(dirname $0)/du_display_image.sh $DU_MONITOR $RAM_DIR > /dev/null;then
    echo "can't display image"
    eval $FAIL_MEG
    exit 1
fi

INT_2=$( get_counter_interrupt )
echo "after interrupt: $INT_2"

if [ $INT_2 -eq  $INT_1 ]; then   
    echo "CPU0 Interrupt cound is not increasing"
    eval $FAIL_MEG
else
	eval $PASS_MEG
fi