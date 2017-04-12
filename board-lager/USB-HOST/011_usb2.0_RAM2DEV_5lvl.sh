#!/bin/bash

echo "copy file 5 level folder from RAM to device"

$(dirname $0)/../helper/write_folder_helper.sh "/mnt/usb" -flvl 5