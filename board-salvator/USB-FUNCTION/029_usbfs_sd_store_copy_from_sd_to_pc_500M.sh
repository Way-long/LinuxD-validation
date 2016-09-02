#!/bin/bash

set -e
#set -x

echo "USB FUNCTION STORE SD COPY"

rm -rf $MEDIA_FOLDER/*

#modprobe device
$CMD_SSH <<ENDSSH

modprobe g_mass_storage file=/dev/mmcblk1p1

ENDSSH

#prepare storage memory
sleep 5 

SD_FOLDER=`ls $MEDIA_FOLDER`

mkdir -p $PC_FOLDER
rm -rf $MEDIA_FOLDER/$SD_FOLDER/*

dd if=/dev/urandom of=$MEDIA_FOLDER/$SD_FOLDER/file-500m bs=1M count=500

cp $MEDIA_FOLDER/$SD_FOLDER/file-500m $PC_FOLDER

cmp $MEDIA_FOLDER/$SD_FOLDER/file-500m $PC_FOLDER/file-500m

if [ "$?" -eq "0" ]; then
	eval $PASS_MEG
else
	eval $FAIL_MEG
fi

rm -rf $PC_FOLDER
rm -rf $MEDIA_FOLDER/$SD_FOLDER/*

#rmmod device
$CMD_SSH <<ENDSSH

rmmod g_mass_storage

ENDSSH

rm -rf $MEDIA_FOLDER/*