#!/bin/bash

echo "switch the key then check interrupt counting"

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
$(dirname $0)/../common/wait_user_action.sh "Please switch SW1,SW2,SW3,SW4 on/off then input \"next\" to continue..." "next"

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
