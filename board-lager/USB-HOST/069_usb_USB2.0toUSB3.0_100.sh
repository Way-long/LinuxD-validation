#!/bin/bash

echo "copy file 100M from USB2.0 to USB3.0"

$(dirname $0)/../helper/write_helper.sh "/mnt/usb30" -bcnt 100 -src "/mnt/usb20"