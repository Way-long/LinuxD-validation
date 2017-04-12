#!/bin/bash
echo "check mount/unmount mmcif device"

dev="/mnt/mmc"

MOUNT="$(dirname $0)/../helper/mount_helper.sh"
UMOUNT="$(dirname $0)/../common/remove_dev_dir.sh"

# TO DO 
$MOUNT "$dev"

df -h | grep "$dev" && echo -e "\nPASSED" || echo -e "\nFAILED"

# clean up
$UMOUNT "$dev"
