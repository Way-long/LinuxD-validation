#!/bin/bash
echo "SDHI unbind/rebind test"

DRIVER="sh_mobile_sdhi"

echo -e "\nunbind/rebind SD0"
DEV_NAME="ee100000.sd"
BLOCK_DEV="/dev/disk/by-path/platform-$DEV_NAME"
$(dirname $0)/../common/unbind-bind-write.sh "$DRIVER" "$DEV_NAME" "$BLOCK_DEV"

echo -e "\nunbind/rebind SD1"
DEV_NAME="ee140000.sd"
BLOCK_DEV="/dev/disk/by-path/platform-$DEV_NAME"
$(dirname $0)/../common/unbind-bind-write.sh "$DRIVER" "$DEV_NAME" "$BLOCK_DEV"

echo "reformat"
mkfs.ext3 "/dev/mmcblk1p1" > /dev/null 2>&1
mkfs.ext3 "/dev/mmcblk2p1" > /dev/null 2>&1
