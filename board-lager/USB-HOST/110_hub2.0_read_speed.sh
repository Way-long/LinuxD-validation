#!/bin/bash

echo "check speed when read file 350 MB from USB HUB 2.0 device to RAM"

$(dirname $0)/../helper/speed_calculator_helper.sh "usb2.0" -log -fsize 350 -read