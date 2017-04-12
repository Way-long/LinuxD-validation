#!/bin/bash

echo "check speed when copy file 350 MB from RAM to SATA device"

$(dirname $0)/../helper/speed_calculator_helper.sh "hd" -log -fsize 350