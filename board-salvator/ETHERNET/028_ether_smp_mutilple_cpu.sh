#!/bin/sh
# ethernet device driver autotest shell-script

set -e
#set -x

echo "\n******************** SMP CONCURRENT ACCESS TEST ************************\n"

# Mount ram
$(dirname $0)/../common/mount-device.sh $RAM_DIR

$(dirname $0)/smp_multiple_cpu.sh

$(dirname $0)/../common/wait_process.sh "/bin/sh ./ftp" > /dev/null

sleep 5

# Umount ram
$(dirname $0)/../common/umount-device.sh $RAM_DIR

echo "\n************************************************************************\n"
