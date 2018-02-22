#!/bin/sh
# usb function device driver autotest shell-script

set -e
#set -x

sleep 5

echo $PCPASSWORD | sudo chown ${PCNAME}:${PCNAME} /dev/ttyACM0 > /dev/null 2>&1

cmd='echo "TEST SERIAL FROM PC TO BOARD PASSED" > /dev/ttyACM0'
echo $cmd

eval $cmd

