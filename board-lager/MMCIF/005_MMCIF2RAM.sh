#!/bin/bash
echo "check if mcc device is readable"

$(dirname $0)/../helper/write_helper.sh "/mnt/mmc"  -read -bcnt 350