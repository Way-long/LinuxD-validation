#!/bin/bash
echo "copy file 350 MB from RAM to SD1 100 times"

$(dirname $0)/../helper/write_helper.sh "/mnt/sd1" -times 80 -bcnt 350
