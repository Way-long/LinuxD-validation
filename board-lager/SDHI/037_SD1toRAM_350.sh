#!/bin/bash

echo "copy file 350 MB from SD1 to RAM"

$(dirname $0)/../helper/write_helper.sh "/mnt/sd1"  -read -bcnt 350