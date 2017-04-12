#!/bin/bash

echo "copy file 350 MB from RAM to SD0"

$(dirname $0)/../helper/write_helper.sh "/mnt/sd0" -bcnt 350