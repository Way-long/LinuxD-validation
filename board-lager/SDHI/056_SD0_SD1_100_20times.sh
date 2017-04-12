#!/bin/bash

echo "write-read 100MB of data 20 times between SD0 and SD1"

$(dirname $0)/../helper/write_helper.sh "sd1" -src "sd0" -bcnt 100 -rw -times 20