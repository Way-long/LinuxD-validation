#!/bin/bash

echo "copy file 10 MB from RAM to SD0 which already have data inside"

$(dirname $0)/../helper/write_helper.sh "/mnt/sd0" -bcnt 10 -hasdata