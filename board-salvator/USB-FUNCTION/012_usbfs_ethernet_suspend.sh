#!/bin/bash

set -e
#set -x

echo "USB FUNCTION ETHERNET SUSPEND"

#modprobe device
$CMD_SSH <<ENDSSH

echo enabled > /sys/devices/platform/soc/e6e88000.serial/tty/ttySC0/power/wakeup
;;


echo mem > /sys/power/state

modprobe g_ether

ifconfig usb0 192.168.0.1 broadcast 192.168.1.255 up

ENDSSH

ifconfig usb0 192.168.0.2 broadcast 192.168.1.255 up

sleep 3

ping -c 10 190.168.0.1

#modprobe device
$CMD_SSH <<ENDSSH

rmmod g_ether

ENDSSH

$(dirname $0)/refresh_ethernet.sh 
