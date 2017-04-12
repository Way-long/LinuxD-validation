#!/bin/bash
echo "check interrupt counting"

((TEST_TIME=10*60))

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
		changed=true
		echo "Temperature now: $t2"
		((diff=$t2-$t1))
		if [[ "$diff" != 5 && "$diff" != -5 ]]; then
			echo "FAILED: the temperature increased in amount of $diff"
			break
		fi
		t1=$t2
		# break if temperature too high
		if [[ "$t2" -ge 70 ]]; then
			break
		fi
	fi
	current_time=`date +%s`
done
$changed && echo "" || echo "WARNING: the temperature not changed"

# check tempreature down
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
		changed=true
		echo "Temperature now: $t2"
		((diff=$t1-$t2))
		if [[ "$diff" != 5 && "$diff" != -5 ]]; then
			echo "FAILED: the temperature increased in amount of $diff"
			break
		fi
		t1=$t2
	fi
	current_time=`date +%s`
done
$changed && echo "" || echo "WARNING: the temperature not changed"