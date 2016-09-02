#!/bin/bash
# usb function device driver autotest shell-script

set -e
#set -x

sleep 2

echo "TEST SERIAL FROM PC TO BOARD PASSED" > /dev/ttyACM0
echo "TEST SERIAL AUTOMATIC author by duclm" > /dev/ttyACM0