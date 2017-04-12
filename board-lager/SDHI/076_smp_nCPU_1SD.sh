#!/bin/bash

echo "smp concurrent access from n CPU to 1 SD card"

$(dirname $0)/../helper/write_by_all_cpu_helper.sh /mnt/sd