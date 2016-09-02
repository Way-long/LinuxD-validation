#!/bin/sh
# ethernet device driver autotest shell-script

set -e
#set -x

echo "\n******************** SMP CONCURRENT ACCESS TEST ************************\n"

eval $MOUNT_RAM

$(dirname $0)/smp_multiple_cpu.sh

$(dirname $0)/../common/wait_process.sh "/bin/sh ./ftp" > /dev/null

sleep 5

eval $UNMOUNT_RAM

echo "\n************************************************************************\n"
