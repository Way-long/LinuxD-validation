#!/bin/bash

echo "copy file 10 MB from device to RAM"

$(dirname $0)/../helper/write_helper.sh "/mnt/usb30"  -read -bcnt 10