#!/bin/bash

echo "suspend after writing usb2.0 device"

$(dirname $0)/../helper/suspend_helper-.sh "/mnt/usb"
