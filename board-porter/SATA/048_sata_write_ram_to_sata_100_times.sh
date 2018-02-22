#!/bin/bash
# sata device driver autotest shell-script

set -e
#set -x

echo "\n*********************SATA TEST READ DATA 100 TIMES**********************\n"

mkdir -p $RAM_DIR
mkdir -p $HDD_DIR

FILE_SIZE="350"

# Mount src_dir and dst_dir
$(dirname $0)/../common/mount-device.sh $RAM_DIR
$(dirname $0)/../common/mount-device.sh $HDD_DIR


# write test
echo "copying ${FILE_SIZE}M file from $RAM_DIR to $HDD_DIR "
for a in $(seq 1 100);
do
    $(dirname $0)/../common/write-common.sh \
    $RAM_DIR $HDD_DIR 1M ${FILE_SIZE}
    echo "Time$a: passed"
done

sync

# Umount src_dir and dst_dir
$(dirname $0)/../common/umount-device.sh $RAM_DIR
$(dirname $0)/../common/umount-device.sh $HDD_DIR

rm -rf $RAM_DIR
rm -rf $HDD_DIR

echo "\n************************************************************************\n"