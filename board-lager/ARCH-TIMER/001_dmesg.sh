#!/bin/bash
echo "checking by dmesg"

dmesg | grep timer | {
	count=0
	while read line;do
		if echo "$line" | grep -io "Architected cp15 timer" > /dev/null ;then
				echo $line
				((count++))
		fi
		if echo "$line" | grep -io "Switching to timer" > /dev/null ;then
				echo $line
				((count++))
		fi
		if echo "$line" | grep -io "Calibrating delay loop" > /dev/null ;then
				echo $line
				((count++))
		fi
	done
	if [[ $count -ge 3 ]]; then
		echo -e "\nPASSED"
	else
		echo -e "\nFAILED"
	fi
}
