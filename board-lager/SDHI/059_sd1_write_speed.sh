#!/bin/bash

echo "check speed when copy file 350 MB from RAM to SD1 card"

$(dirname $0)/../helper/speed_calculator_helper.sh "/mnt/sd1" -log