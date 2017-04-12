
echo "checking gpio interrupt"

cat /proc/interrupts | grep gpio |

if true; then
	count=0
	while read line;do
		if [[ "$line" == *gpio ]]
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
