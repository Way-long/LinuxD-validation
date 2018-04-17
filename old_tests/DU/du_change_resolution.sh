#!/bin/sh
# display unit device driver autotest shell-script

set -e
#set -x

if [ $# -lt 2 ]; then
    echo "usage : $(basename $0) DISPLAY_MONITOR (HD_SUPPORT(boolean))"
    exit 1
fi

DU_MONITOR="$1"
HD_SUPPORT="$2"

echo "\n Please connect $DU_MONITOR before test this item \n"

eval $RESET_COMMAND

sleep 3

# 800 x 600
cmd="fbset -xres 800 -yres 600 -laced 0"
echo $cmd

if ! $cmd;then
    echo "not support resolution 800 x 600"
    eval $FAIL_MEG
    exit 1
fi

if ! $(dirname $0)/du_display_image.sh $DU_MONITOR $RAM_DIR > /dev/null;then
    echo "can't display image with resolution 800 x 600"
    eval $FAIL_MEG
    exit 1
fi 

# 1024 x 768
cmd="fbset -xres 1024 -yres 768 -laced 0"
echo $cmd

if ! $cmd;then
    echo "not support resolution 1024 x 768"
    eval $FAIL_MEG
    exit 1
fi    

if ! $(dirname $0)/du_display_image.sh $DU_MONITOR $RAM_DIR > /dev/null;then
    echo "can't display image with resolution 1024 x 768"
    eval $FAIL_MEG
    exit 1
fi 

if [ "$HD_SUPPORT" = "1" ];then
    
    #1280 x 720
    if ! fbset -xres 1280 -yres 720 -laced 0;then
        echo "not support resolution 1280 x 720"
        eval $FAIL_MEG
        exit 1
    fi    

    if ! $(dirname $0)/du_display_image.sh $DU_MONITOR $RAM_DIR > /dev/null;then
        echo "can't display image with resolution 1280 x 720"
        eval $FAIL_MEG
        exit 1
    fi 

    # 1920 x 1080
    if ! fbset -xres 1920 -yres 1080 -laced 0;then
        echo "not support resolution 1920 x 1080"
        eval $FAIL_MEG
        exit 1
    fi    

    if ! $(dirname $0)/du_display_image.sh $DU_MONITOR $RAM_DIR > /dev/null;then
        echo "can't display image with resolution 1920 x 1080"
        eval $FAIL_MEG
        exit 1
    fi

fi

eval $PASS_MEG
