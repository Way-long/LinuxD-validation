#!/bin/bash

echo "copy file 350 MB from RAM to SATA device"

$(dirname $0)/../helper/write_helper.sh "/mnt/hd" -bcnt 350 -hasdata
