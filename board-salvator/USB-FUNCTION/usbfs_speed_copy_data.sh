#!/bin/bash
# usb function device driver autotest shell-script

set -a
#set -x

if [ $# -lt 3 ]; then
    echo "usage : $(basename $0) SOURCE_PATH DESTINATION_PATH FILE_SIZE (HAS_DATA)"
    exit 1
fi

SRC_DIR="$1"
DST_DIR="$2"
FILE_SIZE="$3"
HAS_DATA="$4"

echo "writing direct: ${SRC_DIR}->${DST_DIR}"

# Setting HD0 have data
if [ "$HAS_DATA" = "1" ];then
	echo "setting $SRC_DIR have file data 50MB"
	dd if=/dev/urandom of="$SRC_DIR/file-50mb" bs=1M count=50
fi

# Prepare data for test
cmd="dd if=/dev/urandom of='$SRC_DIR/file-${FILE_SIZE}mb' bs=1M count=${FILE_SIZE}"
echo $cmd

if ! eval $cmd ;then
	echo "Prepare data error"
	eval $FAIL_MEG
	exit 1
fi

sync

# Copy data
echo "copying ${FILE_SIZE}M file from ${SRC_DIR} to ${DST_DIR}"

cmd="cp $SRC_DIR/file-${FILE_SIZE}mb $DST_DIR"
echo $cmd

{ time $cmd; } 2> log_cp.txt
{ time sync; } 2> log_unmount.txt

cat log_cp.txt

cat log_unmount.txt
#get time on log_cp file

fil=log_cp.txt

if [ -f $fil ]
then

#get minutime from log file
time_cp_minute=`grep real $fil | tail -1 | cut -d l -f2 | cut -d m -f1`

#get second from log file
time_cp_second=`grep real $fil | tail -1 | cut -d m -f2 | cut -d s -f1`

#convert string to number

time_cp_minute_second=$(( $time_cp_minute * 60 )) #second

time_cp="$(echo  $time_cp_second + $time_cp_minute_second | bc)"

fi

rm log_cp.txt

#get time on log_unmount file

fil=log_unmount.txt

if [ -f $fil ]
then

#get minutime from log file
time_umount_minute=`grep real $fil | tail -1 | cut -d l -f2 | cut -d m -f1`

#get second from log file
time_umount_second=`grep real $fil | tail -1 | cut -d m -f2 | cut -d s -f1`

time_umount_minute_second=$(( $time_umount_minute * 60 )) #second

time_umount="$(echo  $time_umount_second + $time_umount_minute_second | bc )"

fi

rm log_unmount.txt

total_time="$(echo  $time_cp + $time_umount | bc )"

speed="$(echo   367 / $total_time | bc -l)"

printf "SPEED: %.*f MB/s" 2 $speed

echo "  "

# Compare data after copy
cmd="cmp $SRC_DIR/file-${FILE_SIZE}mb $DST_DIR/file-${FILE_SIZE}mb"
echo $cmd

if ! eval $cmd ;then
	echo "Compare data error"
	eval $FAIL_MEG
	exit 1
fi

eval $PASS_MEG