#!/bin/bash
echo "checking by dmesg"

dmesg | grep rcar_thermal | {
	count=0
	while read line;do
		if echo "$line" | grep -io "sensor probed" > /dev/null ;then
				echo $line
				((count++))
		fi
	done
	if [[ $count -ge 1 ]]; then
		echo -e "\nPASSED"
	else
		echo -e "\nFAILED"
	fi
}
