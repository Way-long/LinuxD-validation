#!/bin/sh

echo "write data between SD0 and SD1 simultenously with file 500 MB"

$(dirname $0)/../helper/write_helper.sh "sd1" -src "sd0" -bcnt 500 -smp