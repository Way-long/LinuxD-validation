#!/bin/bash

echo "copy file 10 MB from RAM to device"

$(dirname $0)/../helper/write_helper.sh "/mnt/usb30" -bcnt 10 -hasdata
