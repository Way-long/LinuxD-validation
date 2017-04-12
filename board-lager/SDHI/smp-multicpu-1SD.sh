#!/bin/bash
# sdhi device driver autotest shell-script

set -e
#set -x

echo "`date` SDHI driver autotest start"

mkdir -p $RAM_DIR
mkdir -p $SD1_DIR

# Mount device
$(dirname $0)/../common/mount-device.sh $RAM_DIR
$(dirname $0)/../common/mount-device.sh $SD1_DIR

echo "Run taskset cpu"

taskset -c 0 $(dirname $0)/smp-write-ram-to-sd1.sh &
taskset -c 1 $(dirname $0)/smp-write-ram-to-sd1.sh &
taskset -c 2 $(dirname $0)/smp-write-ram-to-sd1.sh &
taskset -c 3 $(dirname $0)/smp-write-ram-to-sd1.sh

sync

# Umount device
$(dirname $0)/../common/umount-device.sh $RAM_DIR
$(dirname $0)/../common/umount-device.sh $SD1_DIR

rm -rf $RAM_DIR/
rm -rf $SD1_DIR/