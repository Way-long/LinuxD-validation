#!/bin/bash
# sdhi device driver autotest shell-script

set -e
#set -x

echo "`date` SDHI driver autotest start"

mount -t tmpfs -o size=400m tmpfs /tmp

echo "Run taskset cpu"

taskset -c 0 $(dirname $0)/ether_10kb_lager_one.sh &
taskset -c 1 $(dirname $0)/ether_10kb_lager_one.sh 1 &
taskset -c 2 $(dirname $0)/ether_10kb_lager_one.sh 2 &
taskset -c 3 $(dirname $0)/ether_10kb_lager_one.sh 3

sleep 900

rm -rf /tmp/*

umount /tmp

