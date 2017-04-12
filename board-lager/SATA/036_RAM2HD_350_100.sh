#!/bin/bash
echo "copy file 350 MB from RAM to SATA device 100 times"

$(dirname $0)/../helper/write_helper.sh "/mnt/hd" -times 80
