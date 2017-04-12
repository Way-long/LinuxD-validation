#!/bin/bash

echo "check speed when read file 350 MB from USB HUB 3.0 device to RAM"

$(dirname $0)/../helper/speed_calculator_helper.sh "usb3.0" -log -fsize 350 -read