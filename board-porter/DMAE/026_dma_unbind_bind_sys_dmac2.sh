#!/bin/sh
# dma device driver autotest shell-script

set -e
#set -x

echo "\n************************DMAE UNBIND BIND DEVICE TEST********************\n"

if ! $(dirname $0)/../common/unbind-bind.sh "$DMAC_SYS_DRIVER" "${SYSDMAC2_INTERRUPT}-controller";then
    eval $FAIL_MEG
    exit 1
fi

eval $PASS_MEG

echo "\n************************************************************************\n"