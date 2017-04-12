
echo "checking key interrupt (sw)"

cat /proc/interrupts | grep SW2 |

if true; then
	count=0
	while read line;do
		echo $line
		((count++))
	done
	if [[ $count -ge 4 ]]; then
		echo -e "\nPASSED"
	else
		echo -e "\nFAILED"
	fi
fi
