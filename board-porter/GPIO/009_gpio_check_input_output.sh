#!/bin/sh

set -e
#set -x

echo "\n************************CHECK GPIO INPUT OUTPUT*************************\n"

echo "NOTE: THIS ITEM TEST NEED CONNECT INSIDE TWO PORT(PIN53 & PIN55)"
sleep 3

OK=0

echo "export port gpio"
# set gpio port
echo $GPIO_PORT_1 > /sys/class/gpio/export
echo $GPIO_PORT_2 > /sys/class/gpio/export

echo "set input output GPIO"

cmd="echo low > /sys/class/gpio/gpio${GPIO_PORT_1}/direction"
echo $cmd
eval $cmd

cmd="echo in > /sys/class/gpio/gpio${GPIO_PORT_2}/direction"
echo $cmd
eval $cmd

for value in "0" "1"
do
	echo $value > /sys/class/gpio/gpio${GPIO_PORT_1}/value

	cat /sys/class/gpio/gpio${GPIO_PORT_2}/value > $LOGFILE

	cat $LOGFILE

	if ! cat $LOGFILE | grep $value > /dev/null; then
		eval $FAIL_MEG
		break;          
	fi

	OK=$(($OK + 1))

done	

if [ "$OK" = "2" ]; then
	eval $PASS_MEG
fi

rm -r $LOGFILE

echo "unexport port gpio"
#unset gpio port
echo $GPIO_PORT_1 > /sys/class/gpio/unexport
echo $GPIO_PORT_2 > /sys/class/gpio/unexport

echo "\n************************************************************************\n"
