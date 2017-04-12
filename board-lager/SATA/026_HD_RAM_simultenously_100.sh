#!/bin/sh

echo "write data between SATA device and RAM simultenously with file 100 MB"

$(dirname $0)/../helper/write_helper.sh "hd" -bcnt 100 -smp