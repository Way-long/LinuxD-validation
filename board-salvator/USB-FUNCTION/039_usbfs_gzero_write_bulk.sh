#!/bin/bash

set -e
#set -x

echo "USB FUNCTION G_ZERO TEST"

$CMD_SSH <<ENDSSH

modprobe usb_f_ss_lb bulk_maxpacket=512

modprobe g_zero

ENDSSH

mount --bind /dev/bus /proc/bus

sleep 5

lsusb > log.txt

bus=`grep Gadget log.txt | tail -1 | cut -d s -f2 | cut -d D -f1 | sed 's/[[:space:]]//g'` 

dev=`grep Gadget log.txt | tail -1 | cut -d c -f2 | cut -d I -f1 | sed 's/[[:space:]]//g' | cut -c 2-4`

./testusb -D /proc/bus/usb/$bus/$dev -t 14 -c 100 -s 256 -v 1

umount /proc/bus

if [ "$?" -eq "0" ]; then
	eval $PASS_MEG
else
	eval $FAIL_MEG
fi

$CMD_SSH <<ENDSSH

rmmod g_zero

ENDSSH