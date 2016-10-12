#!/bin/bash
# umount devices

echo "Umount devices"

set -e
#set -x

if [ $# -ne 1 ]; then
        echo "usage: $(basename $0) PATTERN" >& 2
fi

DEV_DIR="$1"

# Umount device

if umount ${DEV_DIR}/;then
        echo "Device $DEV_DIR have umounted"
else
        echo "Device $DEV_DIR umount is error" >&2
fi
