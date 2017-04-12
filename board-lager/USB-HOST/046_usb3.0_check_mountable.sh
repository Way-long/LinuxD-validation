#!/bin/bash
echo "check mount/unmount USB30 device"

$(dirname $0)/../helper/check_mountable_helper.sh "usb30"
