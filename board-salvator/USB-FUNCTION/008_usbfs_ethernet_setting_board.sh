#!/bin/bash

set -e
#set -x

echo "USB FUNCTION ETHERNET SETTING"

#modprobe device
$CMD_SSH <<ENDSSH

modprobe g_ether

ifconfig -a 

rmmod g_ether

ENDSSH
