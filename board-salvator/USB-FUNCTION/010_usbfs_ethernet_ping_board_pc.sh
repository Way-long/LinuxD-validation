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

ping -c 10 190.168.0.2

rmmod g_ether

ENDSSH

$(dirname $0)/refresh_ethernet.sh 