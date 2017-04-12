#!/bin/bash

echo "copy file 350 MB from SATA device to RAM 100 times"

$(dirname $0)/../helper/write_helper.sh "/tmp/hd" -read -times 80
