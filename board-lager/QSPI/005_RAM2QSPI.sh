#!/bin/bash
echo "copy file 10 MB from QSPI storage to RAM"

$(dirname $0)/../helper/write_helper.sh "/mnt/mtdblock2" -bcnt 10 -read