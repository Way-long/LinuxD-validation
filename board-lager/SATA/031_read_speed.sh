#!/bin/bash

echo "check speed when read file 350 MB from SATA device to RAM"

$(dirname $0)/../helper/speed_calculator_helper.sh "hd" -log -fsize 350 -read