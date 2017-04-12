#!/bin/sh

echo "write data between SD0 and RAM simultenously with file 100 MB"

$(dirname $0)/../helper/write_helper.sh "sd0" -bcnt 100 -smp