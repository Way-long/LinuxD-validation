#!/bin/bash
echo "copy file 10 MB from RAM to QSPI storage"

$(dirname $0)/../helper/write_helper.sh "/mnt/mtdblock2" -bcnt 10