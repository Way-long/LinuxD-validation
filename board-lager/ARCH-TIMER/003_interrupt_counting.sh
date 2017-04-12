#!/bin/bash
echo "check ARCH-TIMER interrupt counting"

sleepTime=5
cache="arch_timer_cache.tmp"

# remember interrupt state
cat /proc/interrupts | grep arch_timer > $cache
echo "sleep $sleepTime second"
sleep $sleepTime
cat $cache | $(dirname $0)/../common/check_interrupt_count.sh $sleepTime
rm $cache