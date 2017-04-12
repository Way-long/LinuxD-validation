#!/bin/bash
echo "copy file 350 MB from SD1 to RAM 100 times"

$(dirname $0)/../helper/write_helper.sh "/mnt/sd1" -times 80 -read -bcnt 350
