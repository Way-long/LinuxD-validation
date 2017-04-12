#!/bin/sh

set -e
#set -x

echo "MMCIF unbind/rebind test"

if [ $# -ne 0 ]; then
	echo "usage: $(basename $0)" >& 2
	exit 1
fi

DRIVER="sh_mmcif"
DEV_NAME="ee220000.mmc"
BLOCK_DEV="/dev/disk/by-path/platform-$DEV_NAME"

exec $(dirname $0)/../common/unbind-bind-write.sh "$DRIVER" "$DEV_NAME" "$BLOCK_DEV"
