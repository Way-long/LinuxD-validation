#!/bin/sh

echo "write data between SD0 and RAM simultenously with file 200 MB"

$(dirname $0)/../helper/write_helper.sh "sd0" -bcnt 200 -smp