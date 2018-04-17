#!/bin/bash

set -e
#set -x

echo "Driver SERIAL TEST"

stty -F $PC_PORT1 $1 cs8 -cstopb

sshpass -p $PASSWD_BOARD ssh -o StrictHostKeyChecking=no root@$IP_BOARD <<ENDSSH

stty -F $PORT1 speed $1 cs8 -cstopb

ENDSSH

sleep 5

$(dirname $0)/listen_from_board.sh & $(dirname $0)/input_1M_from_pc.sh

sshpass -p $PASSWD_BOARD ssh -o StrictHostKeyChecking=no root@$IP_BOARD <<ENDSSH

mv log.txt /root/log_tranfer_file/$1_$2_serial.txt

ENDSSH