#!/bin/bash

echo "check speed when copy file 350 MB from RAM to USB2.0 device"

$(dirname $0)/../helper/speed_calculator_helper.sh "usb" -log -fsize 350