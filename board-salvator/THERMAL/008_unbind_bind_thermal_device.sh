#!/bin/sh
# thermal device driver autotest shell-script

set -e
#set -x

echo "\n**********************UNBIND BIND THERMAL DRIVER***************\n"

if ! $(dirname $0)/../common/unbind-bind.sh "$DRIVER" "$INTERRUPT";then
        echo "TEST FAILED"
        exit 1
fi

$(dirname $0)/003_thermal_temperature_chip.sh

echo "\n***************************************************************\n"