#!/bin/sh
# sdhi device driver autotest shell-script

set -a
#set -x

if [ $# -lt 1 ]; then
    echo "usage : $(basename $0) SDHI_DIRECTORY"
    exit 1
fi

SRC_DIR="$1"
CARD=`echo $SRC_DIR | tail -1 | cut -d d -f2`

INTERRUPT=$(eval "echo \"\$SDHI_INTERRUPT_${CARD}\"")

if ! $(dirname $0)/../common/unbind-bind.sh "$DRIVER" "$INTERRUPT";then
    eval $FAIL_MEG
    exit 1
fi

sync
sleep 5

$(dirname $0)/sdhi_copy_data.sh $RAM_DIR $SRC_DIR 10