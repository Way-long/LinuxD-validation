#!/bin/bash

echo "copy file 100 MB from RAM to device"

$(dirname $0)/../helper/write_helper.sh "/mnt/usb" -bcnt 100 -hasdata