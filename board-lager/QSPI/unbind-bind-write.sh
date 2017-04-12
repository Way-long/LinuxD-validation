#!/bin/sh

set -e
#set -x

echo "QSPI unbind/bind/write test"

if ! $(dirname $0)/../common/unbind-bind.sh "$DRIVER" "$QSPI_INTERRUPT";then
        echo "TEST FAILED"
        exit 1
else
	$(dirname $0)/write-RAM-to-QSPI.sh
fi

if [ $? -eq 0 ];then
        echo "TEST PASSED"
else
        echo "TEST FAILED"
        exit 1
fi