#!/bin/bash

set -e
#set -x

echo "\n**********************USB FUNCTION SERIAL TEST*****************\n"

rm -rf /dev/ttyACM0

sleep 5

$CMD_SSH <<ENDSSH

modprobe g_serial

ENDSSH

sleep 5

$(dirname $0)/listen_from_board.sh & $(dirname $0)/input_from_pc.sh

sleep 2

$CMD_SSH <<ENDSSH

cat log.txt

rm -rf log.txt

rmmod g_serial

ENDSSH

echo "\n***************************************************************\n"