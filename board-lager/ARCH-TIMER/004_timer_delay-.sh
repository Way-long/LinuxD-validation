#!/bin/bash
echo "check ARCH-TIMER interrupt counting and delay"

ON_BOARD_PATH=`$(dirname $0)/../common/path_helper.sh`

sleepTime=120
# sleepTime=5
((max_delay=$sleepTime+2))
cache="arch_timer_delay_cache.tmp"

# remember interrupt state
ssh $SSH_AUTHEN "cat /proc/interrupts | grep arch_timer > $cache"
echo "sleep $sleepTime second"
# remember sleep time
t1=`date +%s`
ssh $SSH_AUTHEN "sleep $sleepTime"
# get wakeup time
t2=`date +%s`
# check delay time
((diff=$t2-$t1))
echo -e "\nactual delay time: $diff second"
if [[ "$diff" -lt "$sleepTime" || "$diff" -gt "$max_delay" ]]; then
	echo "FAILED: the delay time is not acceptable"
else
	echo "PASSED"
fi
# check interrupt counting
echo -e "\ncheck interrupt counting:"
ssh $SSH_AUTHEN "cat $cache | $ON_BOARD_PATH/../common/check_interrupt_count.sh $sleepTime"
ssh $SSH_AUTHEN  "rm $cache"
