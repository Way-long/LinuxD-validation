#!/bin/bash
# sata device driver autotest shell-script

set -a
#set -x

echo "\n******************** SMP TEST MULTIPLE CPU *****************************\n"

mkdir -p $RAM_DIR
mkdir -p $HDD_DIR

# Mount the device
echo "Mount the devices"
if ! $(dirname $0)/../common/mount-device.sh $RAM_DIR > /dev/null; then
    echo "Could not mount $RAM_DIR"
    eval $FAIL_MEG
    exit 1
fi

if ! $(dirname $0)/../common/mount-device.sh $HDD_DIR > /dev/null; then
    echo "Could not mount $HDD_DIR"
    eval $FAIL_MEG
    exit 1
fi

# Clear data for test
if [ "$(ls -A $HDD_DIR)" ]; then
    rm -r $HDD_DIR/* 
fi

if [ "$(ls -A $RAM_DIR)" ]; then
    rm -r $RAM_DIR/* 
fi

$(dirname $0)/sata_taskset_copy_data.sh $HDD_DIR $HDD_DIR1

$(dirname $0)/../common/wait_process.sh "/bin/bash ./sata_smp_read_write_copy_one.sh"

sync

# Unmount device
if ! $(dirname $0)/../common/umount-device.sh $RAM_DIR > /dev/null; then
    echo "Could not umount the ${RAM_DIR}"
fi
if ! $(dirname $0)/../common/umount-device.sh $HDD_DIR > /dev/null; then
    echo "Could not umount the ${HDD_DIR}"
fi

# Clear data for test
if [ "$(ls -A $HDD_DIR)" ]; then
    rm -r $HDD_DIR/* 
fi

if [ "$(ls -A $RAM_DIR)" ]; then
    rm -r $RAM_DIR/* 
fi

rm -rf $RAM_DIR
rm -rf $HDD_DIR

echo "\n************************************************************************\n"