#!/bin/bash

echo "check speed when copy file 350 MB from RAM to usb30 device"

$(dirname $0)/../helper/speed_calculator_helper.sh "usb30" -log -fsize 350