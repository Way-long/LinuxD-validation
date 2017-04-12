#!/bin/bash

echo "unbind then rebind the GPIO driver"

set -e

GPIO_KEY_DIR="/sys/bus/platform/drivers/gpio-keys"
GPIO_KEY_DRIVER="/sys/bus/platform/drivers/gpio-keys/keyboard"
GPIO_KEY_NAME="keyboard"
GPIO_RCAR_DIR="/sys/bus/platform/drivers/gpio_rcar"
GPIO_RCAR_DRIVER="/sys/bus/platform/drivers/gpio_rcar/e6051000.gpio"
GPIO_RCAR_NAME="e6051000.gpio"


check_path="$GPIO_KEY_DRIVER $GPIO_RCAR_DRIVER"
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

echo "Unbind GPIO KEY"
echo "$GPIO_KEY_NAME" > "$GPIO_KEY_DIR/unbind"
check_unbind "$GPIO_KEY_DRIVER"

echo "Unbind GPIO RCAR"
echo "$GPIO_RCAR_NAME" > "$GPIO_RCAR_DIR/unbind"
check_unbind "$GPIO_RCAR_DRIVER"

echo "Bind GPIO RCAR"
echo "$GPIO_RCAR_NAME" > "$GPIO_RCAR_DIR/bind"
echo "Wait for device files to be recreated"
wait_and_check "$GPIO_RCAR_DRIVER"

echo "Bind GPIO KEY"
echo "$GPIO_KEY_NAME" > "$GPIO_KEY_DIR/bind"
echo "Wait for device files to be recreated"
wait_and_check "$GPIO_KEY_DRIVER"

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

