#!/bin/bash

echo "copy file 10 MB from RAM to SD1"

$(dirname $0)/../helper/write_helper.sh "/mnt/sd1" -bcnt 10