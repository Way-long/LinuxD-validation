#!/bin/bash

echo "check speed when copy file 350 MB from RAM to USB HUB 3.0 device"

$(dirname $0)/../helper/speed_calculator_helper.sh "usb3.0" -log -fsize 350