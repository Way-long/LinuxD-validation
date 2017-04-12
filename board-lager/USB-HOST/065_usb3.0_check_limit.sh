#!/bin/bash

echo "check writing data when USB3.0 device has no more space"

$(dirname $0)/../helper/check_limit_helper.sh "/mnt/usb30"