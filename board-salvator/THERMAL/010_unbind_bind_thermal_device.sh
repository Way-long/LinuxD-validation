#!/bin/bash
# thermal device driver autotest shell-script

set +x
#set -x

echo "\n**********************UNBIND BIND THERMAL DRIVER***************\n"

if ! $(dirname $0)/../common/unbind-bind.sh "$THERMAL_DRIVER" "$THERMAL_INTERRUPT1";then
        echo "TEST FAILED"
        exit 1
fi

$(dirname $0)/exec_thermal.sh 005_thermal_temperature_sensors.sh

echo "\n***************************************************************\n"