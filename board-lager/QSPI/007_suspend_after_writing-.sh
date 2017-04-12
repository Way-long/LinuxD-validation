#!/bin/bash
echo "suspend after writing QSPI"

$(dirname $0)/../helper/suspend_helper-.sh "/mnt/mtdblock2" -bcnt 5