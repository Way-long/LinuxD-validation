#!/bin/bash

echo "check speed when read file 350 MB from USB2.0 device to RAM"

$(dirname $0)/../helper/speed_calculator_helper.sh "usb" -log -fsize 350 -read