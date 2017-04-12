#!/bin/bash
echo "measure temperature"

t=`$(dirname $0)/get_temperature.sh`
echo "Temperature: $t"
if [[ 10 -le "$t" && "$t" -le 100 ]]; then
	echo -e "\nPASSED"
else
	echo -e "\nFAILED"
fi