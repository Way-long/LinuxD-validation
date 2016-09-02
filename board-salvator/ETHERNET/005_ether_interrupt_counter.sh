#!/bin/sh
# ethernet device driver autotest shell-script

set -e
#set -x

echo "\n*******************ETHERNET INTERRUPT COUNTER CHECK*********************\n"

# CMT interrupt test
BEFORE=$($(dirname $0)/../common/interrupt-count.sh "$INTERFACE")

ping -c 5 -I $INTERFACE $GOOGLE

AFTER=$($(dirname $0)/../common/interrupt-count.sh "$INTERFACE")

echo $BEFORE
echo $AFTER

i=0
for path in $BEFORE
do
	if [ $i -eq 0 ]; then
		cpu0_before=$path	
	fi	
	i=$(($i + 1))
done

y=0
for path in $AFTER
do
	if [ $y -eq 0 ]; then
		cpu0_after=$path	
	fi	
	y=$(($y + 1))
done

# Show result
echo "Before interrupt CPU0: $cpu0_before"
echo "After interrupt CPU0: $cpu0_after"


if [ $cpu0_before -ge $cpu0_after ]; then
        echo "Interrupt cound is not increasing"
else 
        echo "TEST PASSED"
fi

echo "\n************************************************************************\n"
