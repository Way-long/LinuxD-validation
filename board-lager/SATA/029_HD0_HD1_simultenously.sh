#!/bin/sh

echo "write data between 2 partitions of SATA device simultenously"

$(dirname $0)/../helper/write_helper.sh "hd0" -src "hd1" -bcnt 1000 -smp
