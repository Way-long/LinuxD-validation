#!/bin/bash

echo "copy file 1 GB from SCSI device to USB 3.0"

$(dirname $0)/../helper/write_helper.sh "/mnt/usbb" -bcnt 1000 -src /mnt/hd