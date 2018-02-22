#!/bin/sh

set -e
#set -x

echo "scif change baudrate test"

sleep 2

sshpass -p $PASSWD_BOARD ssh -o StrictHostKeyChecking=no root@$IP_BOARD <<ENDSSH

rm -rf /root/log_tranfer_file/*

ENDSSH