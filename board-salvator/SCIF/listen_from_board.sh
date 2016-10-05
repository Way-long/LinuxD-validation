#!/bin/bash

set -e
#set -x

sshpass -p $PASSWD_BOARD ssh -o StrictHostKeyChecking=no root@$IP_BOARD <<ENDSSH

cat $PORT1 > log.txt & sleep 5

ENDSSH
