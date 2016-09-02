#!/bin/sh
# sata device driver autotest shell-script

set -e
#set -x

echo "\n************************SATA UNBIND BIND DEVICE TEST********************\n"

if ! $(dirname $0)/../common/unbind-bind.sh "$DRIVER" "$SATA_INTERRUPT";then
    eval $FAIL_MEG
    exit 1
fi

sync
sleep 5

$(dirname $0)/sata_copy_data.sh $RAM_DIR $HDD_DIR 10

echo "\n************************************************************************\n"