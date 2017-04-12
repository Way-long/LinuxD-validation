#!/bin/bash

echo "copy file 1G from USB2.0 to USB3.0"

$(dirname $0)/../helper/write_helper.sh "/mnt/usb30" -bcnt 1000 -src "/mnt/usb20"