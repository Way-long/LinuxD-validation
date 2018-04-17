#!/bin/bash
# usb function device driver autotest shell-script

set -e
#set -x

echo "\n************USB FUNCTION ZERO READ CONTROL TEST************\n"

$CMD_SSH <<ENDSSH

$SHELL_SOURCE_CODE/$DRIVER_PATH/usbfs_modprobe.sh usb_f_ss_lb isoc_maxpacket=512

$SHELL_SOURCE_CODE/$DRIVER_PATH/usbfs_modprobe.sh g_zero

ENDSSH

if ! sudo mount --bind /dev/bus /proc/bus;then
	echo "mount bus device error"
	eval $FAIL_MEG
	exit 1
fi	

sleep 5

lsusb

lsusb > $LOGFILE

bus=`grep Gadget $LOGFILE | tail -1 | cut -d s -f2 | cut -d D -f1 | sed 's/[[:space:]]//g'` 

dev=`grep Gadget $LOGFILE | tail -1 | cut -d c -f2 | cut -d I -f1 | sed 's/[[:space:]]//g' | cut -c 2-4`

echo $bus 

echo $dev

if $(dirname $0)/testusb -D /proc/bus/usb/${bus}/${dev} -t 10;then
	eval $PASS_MEG
else
	eval $FAIL_MEG
fi

if ! umount /proc/bus;then
	echo "umount bus device error"
fi	

rm -rf $LOGFILE

$CMD_SSH <<ENDSSH

$SHELL_SOURCE_CODE/$DRIVER_PATH/usbfs_rmmod.sh g_zero

ENDSSH

echo "\n***********************************************************\n"