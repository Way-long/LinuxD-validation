#!/bin/sh
# sdhi device driver autotest shell-script

set -a
#set -x

if df | grep "$SD1_DIR"; then
    umount $SD1_DIR
fi

if df | grep "$SD1_DIR"; then
    umount $SD2_DIR
fi

if df | grep "$RAM_DIR"; then
    umount $RAM_DIR
fi