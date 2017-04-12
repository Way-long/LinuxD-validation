#!/bin/bash

echo "copy file 1G from USB3.0 to USB2.0"

$(dirname $0)/../helper/write_helper.sh "/mnt/usb30" -bcnt 1000 -src "/mnt/usb20" -read