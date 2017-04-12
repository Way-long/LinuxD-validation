#!/bin/bash

echo "suspend the system while switching the sw key"

$(dirname $0)/../common/enable_tty_wakeup.sh $WAKEUP_PORT

function getInterruptCount {
IRQ="$1"
IRQ=${IRQ%% [A-Za-z]*}
IRQ=${IRQ#* }
echo $IRQ   
}

#remember the beginning state
count=0
while read line;do
	ISW[$count]="$line";
	((count++))
done < <(cat /proc/interrupts | grep SW2)

#wait user action
echo "The system is going to be suspended. After 3 seconds, wake up the system by the console..."

echo mem > /sys/power/state

$(dirname $0)/../common/wait_user_action.sh "\n\n\nPlease switch SW1,SW2,SW3,SW4 on/off then input \"next\" to continue..." "next"

#check interrupte counting
cat /proc/interrupts | grep SW2 | {
	pass=1
	count=0
	while read line;do
		cur_line=$line
		cur=$(getInterruptCount "$cur_line");
		cpu0_cur=(${cur// / })
		prev_line=${ISW[$count]}
		prev=$(getInterruptCount "$prev_line")
		cpu0_prev=(${prev// / })
		if [ $cpu0_prev -ge $cpu0_cur ]; then
			echo "Interrupt not increased as expected"
			echo "PREVIOUS: $prev_line"
			echo "CURRENT : $cur_line"
			pass=0
		fi

		((count++))
	done
	if [[ $pass -eq 1 ]]; then
        	echo "PASSED"
	else 
        	echo "FALSE"
	fi
	
}
