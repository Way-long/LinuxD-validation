#!/bin/bash

echo "check speed when read file 350 MB from usb30 device to RAM"

$(dirname $0)/../helper/speed_calculator_helper.sh "usb30" -log -fsize 350 -read