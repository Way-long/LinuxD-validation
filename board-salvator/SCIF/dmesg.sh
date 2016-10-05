#!/bin/sh

set -e
#set -x

echo "sh-sci dmesg feature test"

sshpass -p $PASSWD_BOARD ssh -o StrictHostKeyChecking=no root@$IP_BOARD <<ENDSSH

dmesg | grep ttySC0

dmesg | grep SCI

ENDSSH