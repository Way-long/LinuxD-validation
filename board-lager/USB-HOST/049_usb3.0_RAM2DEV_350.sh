#!/bin/bash

echo "copy file 350 MB from RAM to device"

$(dirname $0)/../helper/write_helper.sh "/mnt/usb30" -bcnt 350
