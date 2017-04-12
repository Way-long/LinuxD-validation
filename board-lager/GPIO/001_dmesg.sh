
echo "checking by dmesg"

dmesg | grep gpio_rcar |
if true; then
	count=0
	while read line;do
		if [[ "$line" == *"driving 32 GPIOs" ]]
			then
				echo $line
				((count++))
		fi
	done
	if [[ $count -ge 6 ]]; then
		echo -e "\nPASSED"
	else
		echo -e "\nFAILED"
	fi
fi
