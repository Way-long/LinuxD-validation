#!/bin/bash
echo "checking interrupt"

cat /proc/interrupts | grep thermal | {
	count=0
	while read line;do
		echo $line
		((count++))
	done
	if [[ $count -ge 1 ]]; then
		echo -e "\nPASSED"
		exit 0
	else
		echo -e "\nFAILED"
		exit 1
	fi
}