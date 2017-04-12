#!/bin/sh

echo "write data between USB2.0 device and RAM simultenously with file 200 MB"

$(dirname $0)/../helper/write_helper.sh "usb20" -bcnt 200 -smp