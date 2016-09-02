#!/bin/bash
# usb function device driver autotest shell-script

set -e
#set -x

sshpass -p $PASSWD_BOARD ssh -o StrictHostKeyChecking=no root@$IP_BOARD <<ENDSSH

modprobe g_serial

cat /dev/ttyGS0 > log.txt & sleep 5

ENDSSH
