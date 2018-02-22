#!/bin/sh
# pciec device driver autotest shell-script

set -a
#set -x

echo "\n******************** SMP CONCURRENT ACCESS TEST ************************\n"

mkdir -p $RAM_DIR

# Mount ram
$(dirname $0)/../common/mount-device.sh $RAM_DIR

$(dirname $0)/smp_multiple_cpu.sh

$(dirname $0)/../common/wait_process.sh "/bin/sh ./ftp" > /dev/null

sleep 5

sync

# Umount ram
$(dirname $0)/../common/umount-device.sh $RAM_DIR

rm -rf $RAM_DIR

echo "\n************************************************************************\n"
