#!/bin/bash

echo "copy file 10 MB from RAM to SATA device"

$(dirname $0)/../helper/write_helper.sh "/mnt/hd" -bcnt 10 -hasdata
