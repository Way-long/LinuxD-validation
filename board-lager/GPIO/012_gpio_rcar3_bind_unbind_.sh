#!/bin/bash

echo "checking gpio rcar interrupt counting after unbind->rebind the rcar3 driver"

set -e

GPIO_SD_DIR="/sys/bus/platform/drivers/gpio_rcar"
GPIO_SD_DRIVER="/sys/bus/platform/drivers/gpio_rcar/e6053000.gpio"
GPIO_SD_NAME="e6053000.gpio"


check_path="$GPIO_SD_DRIVER"
result=0

exists (){
	for i in $1; do
		if [ ! -e "$i" ]; then
        		echo \'$i\': No such file or directory >&2
        		return 1
		fi
	done
	echo "pass"
	return 0
}

check_unbind (){
	for i in $1; do
		sleep 1
		if [ -e "$i" ]; then
			echo Failed to unbind: \'$i\' still exists >&2
			return 1
		fi
	done
	echo "pass"
	return 0
}

wait_and_check (){
	for i in $(seq 1 32); do
		OK="true"
		for i in $1; do
			if [ ! -e "$i" ]; then
				OK="false"
				break
			fi
		done
		if [ "$OK" = "false" ]; then
			sleep 1
		else 
			break
		fi
	done
}

echo "Test device files exists"
exists "$check_path"


echo "Unbind GPIO SD"
echo "$GPIO_SD_NAME" > "$GPIO_SD_DIR/unbind"
check_unbind "$GPIO_RCAR_DRIVER"

echo "Bind GPIO SD"
echo "$GPIO_SD_NAME" > "$GPIO_SD_DIR/bind"
echo "Wait for device files to be recreated"
wait_and_check "$GPIO_SD_DRIVER"

echo "Test that device files once again exist"
exists "$check_path"

#check interrupt counting
set +e

function getInterruptCount {
IRQ="$1"
IRQ=${IRQ%% [A-Za-z]*}
IRQ=${IRQ#* }
echo $IRQ   
}

$(dirname $0)/../common/wait_user_action.sh "Ensure that the board HAS AT LEAST ONE SLOT to insert the sd card then input \"next\" to continue..." "next"

#========================================= check interrupt counting when insert a sd card ======================================

#remember the beginning state
count=0
while read line;do
	if [[ "$line" == *gpio ]];then
		ISW[$count]="$line";
		((count++))
	fi
done < <(cat /proc/interrupts | grep e6053000.gpio)

#wait user action
$(dirname $0)/../common/wait_user_action.sh "\nPlease INSERT the sd card then input \"next\" to continue..." "next"

#check interrupte counting
cat /proc/interrupts | grep e6053000.gpio | {
	pass=1
	count=0
	while read line;do
		if [[ "$line" == *gpio ]];then
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
		fi
	done
	if [[ $pass -eq 1 ]]; then
        	echo "PASSED"
	else 
        	echo "FALSE"
	fi
	
}


#========================================= check interrupt counting when remove the sd card ======================================

#remember the beginning state
count=0
while read line;do
	if [[ "$line" == *gpio ]];then
		ISW[$count]="$line";
		((count++))
	fi
done < <(cat /proc/interrupts | grep e6053000.gpio)

#wait user action
$(dirname $0)/../common/wait_user_action.sh "\n\nPlease REMOVE the sd card then input \"next\" to continue..." "next"

#check interrupte counting
cat /proc/interrupts | grep e6053000.gpio | {
	pass=1
	count=0
	while read line;do
		if [[ "$line" == *gpio ]];then
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
		fi
	done
	if [[ $pass -eq 1 ]]; then
        	echo "PASSED"
	else 
        	echo "FALSE"
	fi
	
}
