#!/bin/bash
echo "check interrupt counting"

((TEST_TIME=10*60))
cache="thermal_cache.tmp"


# remember interrupt state
cat /proc/interrupts | grep arch_timer > $cache
# measure temperature
t1=`$(dirname $0)/get_temperature.sh`
echo "Temperature: $t1"
changed=false
#wait user action
$(dirname $0)/../common/wait_user_action.sh "UNPLUG the fan to make temperature change then input \"next\" to continue..." "next"
echo "testing.... be patien"
current_time=`date +%s`
((target_time=$current_time+$TEST_TIME))
while [[ "$current_time" -le "$target_time" ]]; do
	t2=`$(dirname $0)/get_temperature.sh`
	if [[ "$t2" != "$t1" ]]; then
		echo "Temperature now: $t2"
		echo "check interrupt counting:"
		cat $cache | $(dirname $0)/../common/check_interrupt_count.sh 1
		changed=true
		break
	fi
	current_time=`date +%s`
done
$changed && echo "" || echo "WARNING: the temperature not changed"

# check tempreature down
cat /proc/interrupts | grep arch_timer > $cache
t1=`$(dirname $0)/get_temperature.sh`
echo "Temperature: $t1"
changed=false
$(dirname $0)/../common/wait_user_action.sh "PLUG the fan back to make temperature change then input \"next\" to continue..." "next"
echo "testing.... be patien"
current_time=`date +%s`
((target_time=$current_time+20))
while [[ "$current_time" -le "$target_time" ]]; do
	t2=`$(dirname $0)/get_temperature.sh`
	if [[ "$t2" != "$t1" ]]; then
		echo "Temperature now: $t2"
		echo "check interrupt counting:"
		cat $cache | $(dirname $0)/../common/check_interrupt_count.sh 1
		changed=true
		break
	fi
	current_time=`date +%s`
done
$changed && echo "" || echo "WARNING: the temperature not changed"


# clean up
rm $cache