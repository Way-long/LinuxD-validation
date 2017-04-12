#!/bin/bash

echo "check speed when read file 350 MB from SD1 card to RAM"

$(dirname $0)/../helper/speed_calculator_helper.sh "/mnt/sd1" -log -read