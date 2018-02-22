#!/bin/bash
# thermal device driver autotest shell-script

set -a
#set -x

echo "\n*********************CHECK INTERRUPT COUTER THERMAL TEST *****************\n"

get_counter_interrupt () {

    words=(`exec $(dirname $0)/../common/proc-interrupts-quiet.sh "$THERMAL_INTERRUPT1"`)

    echo ${words[1]}    
}

# CMT interrupt test
INT_1=$( get_counter_interrupt )
echo "before interrupt: $INT_1"

for i in $(seq 1 10);
do

	yes > /dev/null &

done

sleep 5

INT_2=$( get_counter_interrupt )
echo "after interrupt: $INT_2"

if [ $INT_2 -eq  $INT_1 ]; then   
    echo "CPU0 Interrupt cound is not increasing"
    eval $FAIL_MEG
else
	eval $PASS_MEG
fi

$(dirname $0)/../common/kill_process.sh "yes > /dev/null" > /dev/null 2>&1

echo "\n************************************************************************\n"
