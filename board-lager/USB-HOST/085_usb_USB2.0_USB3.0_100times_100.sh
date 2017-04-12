#!/bin/sh

echo "write data between USB2.0 and USB3.0 with file 100 MB 100 times"

$(dirname $0)/../helper/write_helper.sh "usb20" -src "usb30" -bcnt 100 -rw -times 100