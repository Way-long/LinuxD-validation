#!/bin/bash
# sata device driver autotest shell-script

set -e
#set -x

echo "\n************************WRITE SPEED DATA********************************\n"

echo "root@linaro-nano:~# mkdir -p /tmp/temp"
mkdir -p /tmp/temp

echo "root@linaro-nano:~# mkdir -p /mnt/hd0"
mkdir -p /mnt/hd0

echo "root@linaro-nano:~# mount -t tmpfs -o size=400M tmpfs /tmp/temp"
mount -t tmpfs -o size=400M tmpfs /tmp/temp

echo "root@linaro-nano:~# mount /dev/sda1 /mnt/hd0"
mount /dev/sda1 /mnt/hd0

echo "root@linaro-nano:~# dd if=/dev/urandom of=/tmp/temp/file-350mb bs=1M count=350"
dd if=/dev/urandom of=/tmp/temp/file-350mb bs=1M count=350

echo "root@linaro-nano:~# time cp /tmp/temp/file-350mb /mnt/hd0;time umount /mnt/hd0"

{ time cp /tmp/temp/file-350mb /mnt/hd0; } 2> log_cp.txt
{ time umount /mnt/hd0; } 2> log_unmount.txt

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

echo "root@linaro-nano:~# umount /tmp/temp/"
umount /tmp/temp/

echo "root@linaro-nano:~# rm -rf /tmp/temp"
rm -rf /tmp/temp

echo "root@linaro-nano:~# rm -rf /mnt/hd0"
rm -rf /mnt/hd0

printf "SPEED: %.*f MB/s" 2 $speed

echo "\n************************************************************************\n"