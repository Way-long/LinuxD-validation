#!/bin/bash
# sata device driver autotest shell-script

set -a
#set -x

echo "\n******************** SMP TEST MULTIPLE CPU *****************************\n"

mkdir -p $RAM_DIR
mkdir -p $HDD_DIR

# Mount src_dir and dst_dir
$(dirname $0)/../common/mount-device.sh $RAM_DIR
$(dirname $0)/../common/mount-device.sh $HDD_DIR

$(dirname $0)/sata_taskset_copy_data.sh

$(dirname $0)/../common/wait_process.sh "taskset"

sync

# Umount src_dir and dst_dir
$(dirname $0)/../common/umount-device.sh $RAM_DIR
$(dirname $0)/../common/umount-device.sh $HDD_DIR

sync

rm -rf $RAM_DIR
rm -rf $HDD_DIR

echo "\n************************************************************************\n"