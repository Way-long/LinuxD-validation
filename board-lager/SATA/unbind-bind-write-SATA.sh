#!/bin/sh

set -e
#set -x

echo "SATA unbind/bind/write test"

if [ $# -ne 0 ]; then
	echo "usage: $(basename $0)" >& 2
	exit 1
fi

DRIVER="sata_rcar"
DEV_NAME="ee300000.sata"
BLOCK_DEV="/dev/sda1"

exec $(dirname $0)/../common/unbind-bind-write-sata.sh \
	"$DRIVER" "$DEV_NAME" "$BLOCK_DEV"
