#!/bin/sh

echo "stress test"

$(dirname $0)/../helper/write_with_stress_helper.sh /mnt/hd
