#!/bin/bash
echo "check if mcc device is writable"

$(dirname $0)/../helper/write_helper.sh "/mnt/mmc" -bcnt 350
