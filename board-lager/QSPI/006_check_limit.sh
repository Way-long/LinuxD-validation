#!/bin/bash

echo "check writing data when QSPI storage has no more space"

$(dirname $0)/../helper/check_limit_helper.sh "mtdblock2"