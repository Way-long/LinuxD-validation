#!/bin/sh

echo "test smp concurrent access"

$(dirname $0)/../helper/write_by_all_cpu_helper.sh /mnt/hd -times 20
