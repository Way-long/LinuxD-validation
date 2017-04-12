#!/bin/bash

echo "copy 5-level folder from USB3.0 to USB2.0"

$(dirname $0)/../helper/write_folder_helper.sh "/mnt/usb3.0" -src "usb2.0" -flvl 5 -read