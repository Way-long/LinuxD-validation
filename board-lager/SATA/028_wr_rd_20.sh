#!/bin/sh

echo "write-read data 20 times"

$(dirname $0)/../helper/write_helper.sh "/tmp/hd" -rw -times 20 -bcnt 200