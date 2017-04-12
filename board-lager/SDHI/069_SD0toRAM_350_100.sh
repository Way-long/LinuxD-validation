#!/bin/bash
echo "copy file 350 MB from SD0 to RAM 100 times"

$(dirname $0)/../helper/write_helper.sh "/mnt/sd0" -times 80 -read -bcnt 350
