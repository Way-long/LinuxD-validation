#!/bin/bash
echo "test read speed on mmc device"

$(dirname $0)/../helper/speed_calculator_helper.sh "usb2.0" -log -fsize 350 -read