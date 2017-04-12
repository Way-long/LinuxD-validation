#!/bin/sh

echo "write data between SATA device and RAM simultenously with file 200 MB"

$(dirname $0)/../helper/write_helper.sh "hd" -bcnt 200 -smp