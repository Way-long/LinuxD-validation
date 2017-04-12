#!/bin/bash

echo "check writing data when SATA device has no more space"

$(dirname $0)/../helper/check_limit_helper.sh "/mnt/hd"