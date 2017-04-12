#!/bin/bash
echo "check mount/unmount mtdblock2 device"

$(dirname $0)/../helper/check_mountable_helper.sh "mtdblock2"
