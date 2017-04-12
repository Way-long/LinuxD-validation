#!/bin/sh

echo "write data between USB2.0 and USB3.0 simultenously with file 200 MB"

$(dirname $0)/../helper/write_helper.sh "usb20" -src "usb30" -bcnt 200 -smp