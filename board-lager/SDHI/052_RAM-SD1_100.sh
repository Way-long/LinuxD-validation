#!/bin/sh

echo "write data between SD1 and RAM simultenously with file 100 MB"

$(dirname $0)/../helper/write_helper.sh "sd1" -bcnt 100 -smp