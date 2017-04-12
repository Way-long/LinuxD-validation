#!/bin/bash

echo "smp concurrent access from 1 CPU to n SD card"

$(dirname $0)/../helper/write_by_one_cpu_helper.sh -dev0 /mnt/sd0 -dev1 /mnt/sd1