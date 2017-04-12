#!/bin/bash

echo "check speed when read file 350 MB from SD0 card to RAM"

$(dirname $0)/../helper/speed_calculator_helper.sh "/mnt/sd0" -log -read