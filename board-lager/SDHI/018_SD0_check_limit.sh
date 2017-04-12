#!/bin/bash

echo "check writing data when SD0 has no more space"

$(dirname $0)/../helper/check_limit_helper.sh "/mnt/sd0"