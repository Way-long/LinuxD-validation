#!/bin/bash

echo "copy file 350 MB from RAM to SCSI device"

$(dirname $0)/../helper/write_helper.sh "/mnt/hd" -bcnt 350