#!/bin/bash

# arguments
DRIVERS="$1"
DEVICE_NAME="$2"
# constant
SYSFS_BASE_DIR="/sys/bus/platform/drivers/"

device="$SYSFS_BASE_DIR/$DRIVERS/$DEVICE_NAME"
echo "check device [$device]"
if [[ ! -e "$device" ]]; then
        echo  "ERROR: no such file or directory"
        exit 1
fi

echo "unbind device"
echo "$DEVICE_NAME" > "$SYSFS_BASE_DIR/$DRIVERS/unbind"
if [[ -e "$device" ]]; then
        echo  "ERROR: unbind failed"
else
        echo "unbind successfully"
fi
