#!/bin/bash
# sdhi device driver autotest shell-script

set -a
#set -x

if [ $# -lt 1 ]; then
    echo "usage : $(basename $0) SDHI_DIRECTORY"
    exit 1
fi

SRC_DIR="$1"

CARD=`echo "${SRC_DIR: -1}"`
DEVICE="/dev/mmcblk${CARD}p1"

echo "root@linaro-nano:~# mkdir -p $RAM_DIR"
mkdir -p $RAM_DIR

echo "root@linaro-nano:~# mkdir -p $SRC_DIR"
mkdir -p $SRC_DIR

echo "root@linaro-nano:~# mount -t tmpfs -o size=400M tmpfs $RAM_DIR"
mount -t tmpfs -o size=400M tmpfs $RAM_DIR

echo "root@linaro-nano:~# mount $DEVICE $SRC_DIR"
mount $DEVICE $SRC_DIR

echo "root@linaro-nano:~# dd if=/dev/urandom of=$SRC_DIR/file-350mb bs=1M count=350"
dd if=/dev/urandom of=$SRC_DIR/file-350mb bs=1M count=350

echo "root@linaro-nano:~# time cp $SRC_DIR/file-350mb $RAM_DIR; time umount $SRC_DIR"
{ time cp $SRC_DIR/file-350mb $RAM_DIR; } 2> log_cp.txt
{ time umount $SRC_DIR; } 2> log_unmount.txt

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

sync

echo "root@linaro-nano:~# umount $RAM_DIR/"
umount $RAM_DIR/

echo "root@linaro-nano:~# rm -rf $RAM_DIR"
rm -rf $RAM_DIR

echo "root@linaro-nano:~# rm -rf $SRC_DIR"
rm -rf $SRC_DIR

printf "SPEED: %.*f MB/s" 2 $speed

echo "  "