#!/bin/bash
# sdhi device driver autotest shell-script

set -a
#set -x

mkdir -p $RAM_DIR

mkdir -p $SD1_DIR

$(dirname $0)/../common/mount-device.sh $RAM_DIR

$(dirname $0)/../common/mount-device.sh $SD1_DIR

dd if=/dev/urandom of=${RAM_DIR}/file-350mb bs=1M count=50

ls ${RAM_DIR}

cp ${RAM_DIR}/file-350mb $SD1_DIR & eval $CMD_SUSPEND