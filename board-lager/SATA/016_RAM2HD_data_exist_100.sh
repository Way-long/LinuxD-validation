#!/bin/bash

echo "copy file 100 MB from RAM to SATA device"

$(dirname $0)/../helper/write_helper.sh "/mnt/hd" -bcnt 100 -hasdata