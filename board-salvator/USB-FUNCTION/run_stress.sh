#!/bin/bash
# usb function device driver autotest shell-script

set -e
#set -x

sshpass -p $PASSWD_BOARD ssh -o StrictHostKeyChecking=no root@$IP_BOARD <<ENDSSH

stress --cpu $CPU_NUMBER --io 8 --vm 4 --vm-bytes 20M --timeout 1800s

ENDSSH
