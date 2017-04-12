#!/bin/bash

echo "checking gpio sd interrupt"

gpio_sd=`$(dirname $0)/../common/get_gpio_sd.sh`
cat /proc/interrupts  | grep "$gpio_sd"
if cat /proc/interrupts  | grep -E "$gpio_sd$" > /dev/null; then
	echo -e "\nPASSED"
else
	echo -e "\nFAILDED"
fi
