#!/bin/bash
echo "unbind/rebind thermal driver"

DRIVER="rcar_thermal"
DEV_NAME="e61f0000.thermal"


cache="thermal_cache.tmp"
# remember interrupt state
cat /proc/interrupts | grep arch_timer > $cache
# measure temperature
t1=`$(dirname $0)/get_temperature.sh`
echo "Temperature: $t1"
[[ 10 -gt "$t1" || "$t1" -gt 100 ]] &&	echo "WARNING: invalid temperature"

$(dirname $0)/../common/unbind-bind.sh "$DRIVER" "$DEV_NAME"

t2=`$(dirname $0)/get_temperature.sh`
echo "Temperature: $t2"
[[ 10 -le "$t2" && "$t2" -le 100 ]] && echo "PASSED" || echo "FAILED"

echo "check interrupt counting:"
cat $cache | $(dirname $0)/../common/check_interrupt_count.sh 1

rm $cache