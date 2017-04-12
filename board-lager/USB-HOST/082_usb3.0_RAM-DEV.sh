#!/bin/sh

echo "write data between USB3.0 device and RAM simultenously with file 200 MB"

$(dirname $0)/../helper/write_helper.sh "usb30" -bcnt 200 -smp