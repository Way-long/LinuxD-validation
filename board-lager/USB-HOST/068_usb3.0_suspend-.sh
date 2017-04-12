#!/bin/bash

echo "suspend after writing USB3.0 device"

$(dirname $0)/../helper/suspend_helper-.sh "/mnt/usb30"
