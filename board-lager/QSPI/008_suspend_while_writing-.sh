#!/bin/bash
echo "suspend while writing QSPI"

$(dirname $0)/../helper/suspend_helper-.sh "/mnt/mtdblock2" -a sww -bcnt 5