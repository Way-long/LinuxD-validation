#!/bin/bash

echo "copy file 1 GB from USB 3.0 to SCSI device"

$(dirname $0)/../helper/write_helper.sh "/mnt/usbb" -bcnt 1000 -src /mnt/hd -read