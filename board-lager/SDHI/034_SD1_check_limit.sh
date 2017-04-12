#!/bin/bash

echo "check writing data when SD1 has no more space"

$(dirname $0)/../helper/check_limit_helper.sh "/mnt/sd1"