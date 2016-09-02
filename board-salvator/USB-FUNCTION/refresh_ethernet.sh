#!/bin/bash
# usb function device driver autotest shell-script

set -e
#set -x

#modprobe device
sshpass -p $PASSWD_BOARD ssh -o StrictHostKeyChecking=no root@$IP_BOARD <<ENDSSH

modprobe g_ether

ifconfig usb0 192.168.0.1 broadcast 192.168.1.255 up

ENDSSH