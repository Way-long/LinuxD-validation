#!/bin/bash
echo "test write speed on mmc device"

$(dirname $0)/../helper/speed_calculator_helper.sh "mmc" -log -fsize 350