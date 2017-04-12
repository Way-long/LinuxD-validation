#!/bin/sh

set -e
#set -x

echo "sdhi.1 unbind/bind/write test"

if [ $# -ne 0 ]; then
	echo "usage: $(basename $0)" >& 2
	exit 1
fi

BLOCK_DEV="/dev/disk/by-path/platform-$SDHI_INTERRUPT_2"

exec $(dirname $0)/../common/unbind-bind-write.sh \
	"$DRIVER" "$SDHI_INTERRUPT_2" "$BLOCK_DEV"

mkdir -p $RAM_DIR
mkdir -p $SD2_DIR

# Mount device
$(dirname $0)/../common/mount-device.sh $RAM_DIR
$(dirname $0)/../common/mount-device.sh $SD2_DIR


$(dirname $0)/smp-write-ram-to-sd2.sh 

sync

# Umount device
$(dirname $0)/../common/umount-device.sh $RAM_DIR
$(dirname $0)/../common/umount-device.sh $SD2_DIR

rm -rf $RAM_DIR/
rm -rf $SD2_DIR/