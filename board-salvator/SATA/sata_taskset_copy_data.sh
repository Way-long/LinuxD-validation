#!/bin/bash
# sata device driver autotest shell-script

set -e
#set -x

echo "Run taskset cpu"

taskset -c 0 $(dirname $0)/sata_smp_read_write_copy_one.sh $RAM_DIR $HDD_DIR 10 &
taskset -c 1 $(dirname $0)/sata_smp_read_write_copy_one.sh $RAM_DIR $HDD_DIR 11 &
taskset -c 2 $(dirname $0)/sata_smp_read_write_copy_one.sh $RAM_DIR $HDD_DIR 12 &
taskset -c 3 $(dirname $0)/sata_smp_read_write_copy_one.sh $RAM_DIR $HDD_DIR 13