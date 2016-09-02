#!/bin/bash
# thermal device driver autotest shell-script

set -e
#set -x

echo "\n*********************TEMPERARUTE CHIP BOARD********************\n"

sensors > $FILE

if ! cat $FILE | grep "temp" ; then
	eval $FAIL_MEG
fi
eval $PASS_MEG

rm -r /mnt/*

echo "\n***************************************************************\n"