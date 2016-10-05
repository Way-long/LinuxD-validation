#!/bin/sh

set -e
#set -x

echo "scif change baudrate test"

sleep 2

sshpass -p $PASSWD_BOARD ssh -o StrictHostKeyChecking=no root@$IP_BOARD <<ENDSSH

stty -F $PORT speed 9600 cs8 -cstopb

ENDSSH

sleep 2

stty -F $PC_PORT 9600 cs8 -cstopb

sshpass -p $PASSWD_BOARD ssh -o StrictHostKeyChecking=no root@$IP_BOARD <<ENDSSH

mount /dev/mmcblk0p1 /mnt

stty -F $PORT speed 38400 cs8 -cstopb

umount /mnt

ENDSSH

stty -F $PC_PORT 38400 cs8 -cstopb


