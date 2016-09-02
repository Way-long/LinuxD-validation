#!/bin/bash

set -e
#set -x

echo "USB FUNCTION ETHERNET PING FROM BOARD TO PC"

#modprobe device
$CMD_SSH <<ENDSSH

modprobe g_ether

ifconfig usb0 192.168.0.1 broadcast 192.168.1.255 up

ENDSSH

ifconfig usb0 192.168.0.2 broadcast 192.168.1.255 up

sleep 3

#modprobe device
$CMD_SSH <<ENDSSH

taskset -c 1 ping -c 100 192.168.0.2 &
taskset -c 2 ping -c 100 192.168.0.2 &
taskset -c 3 ping -c 100 192.168.0.2 &
taskset -c 0 ping -c 100 192.168.0.2

rmmod g_ether

ENDSSH

if [ "$?" -eq "0" ]; then
	eval $PASS_MEG
else
	eval $FAIL_MEG
fi

$(dirname $0)/refresh_ethernet.sh 