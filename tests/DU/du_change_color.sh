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

#depth 16
for color in "5,6,5,0" "5,5,5,1"; do

    cmd="fbset -depth 32 -rgba $color"
    echo $cmd

    if ! $cmd;then
        echo "not support rgba $color"
        eval $FAIL_MEG
        exit 1
    fi    

    if ! $(dirname $0)/du_display_image.sh $DU_MONITOR $RAM_DIR > /dev/null;then
        echo "can't display image with rgba $color"
        eval $FAIL_MEG
        exit 1
    fi 

    eval $RESET_COMMAND

    sleep 3
done

#depth 32
for color in "8,8,8,0" "8,8,8,8"; do

    cmd="fbset -depth 32 -rgba $color"
    echo $cmd

    if ! $cmd;then
        echo "not support rgba $color"
        eval $FAIL_MEG
        exit 1
    fi    

    if ! $(dirname $0)/du_display_image.sh $DU_MONITOR $RAM_DIR > /dev/null;then
        echo "can't display image with rgba $color"
        eval $FAIL_MEG
        exit 1
    fi

    eval $RESET_COMMAND

    sleep 3

done

eval $PASS_MEG
