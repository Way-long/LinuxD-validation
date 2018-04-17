#!/bin/sh
# usb function device driver autotest shell-script

set -e
#set -x

echo "\n**************USB FUNCTION PING PC TO BOARD********************\n"

#modprobe device
$CMD_SSH <<ENDSSH

$SHELL_SOURCE_CODE/$DRIVER_PATH/usbfs_modprobe.sh g_ether

ENDSSH

sleep 5

$CMD_SSH <<ENDSSH

ifconfig usb0 $IP_ADDRESS_BOARD broadcast $USBFS_BROAD_CAST up

ENDSSH

sleep 2

if ! sudo ifconfig $USBFS_ETHER_INTERFACE_PC $IP_ADDRESS_PC broadcast $USBFS_BROAD_CAST up;then
	echo "setting ip address for PC error"
	eval $FAIL_MEG
	exit 1
fi
sleep 2

# setting network on board
$CMD_SSH <<ENDSSH

exec $SHELL_SOURCE_CODE/$DRIVER_PATH/exec_usbfs.sh usbfs_setting_network_on_board.sh

ENDSSH

cmd="ping -c 10 $IP_ADDRESS_BOARD >> $LOGFILE"
echo $cmd
if ! eval $cmd;then
    echo "ping error."
    eval $FAIL_MEG
	exit 1
fi

cat $LOGFILE

LOG=`cat $LOGFILE`

rm -rf $LOGFILE

if ! echo $LOG | grep "received, 0% packet loss" > /dev/null ;then 
	echo "packet loss error"
	eval $FAIL_MEG
	exit 1
fi

eval $PASS_MEG

sleep 2

#rmmod device
$CMD_SSH <<ENDSSH

$SHELL_SOURCE_CODE/$DRIVER_PATH/usbfs_rmmod.sh g_ether

ENDSSH

echo "\n***************************************************************\n"
