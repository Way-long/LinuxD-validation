#!/bin/bash

set -e
#set -x

echo "\n************************CHECK GPIO INTERRUPT COUNTER*******************\n"

echo "NOTE: THIS ITEM TEST NEED CONNECT INSIDE TWO PORT(PIN53 & PIN55)"
sleep 3;

get_counter_interrupt () {

    words=(`exec $(dirname $0)/../common/proc-interrupts-quiet.sh "$LIB_GPIO"`)

    echo ${words[1]}    
}

OK=0

echo "export port gpio"
# set gpio port
echo $GPIO_PORT_1 > /sys/class/gpio/export
echo $GPIO_PORT_2 > /sys/class/gpio/export

echo "set gpio port"
#count up
echo low > /sys/class/gpio/gpio${GPIO_PORT_2}/direction
echo rising > /sys/class/gpio/gpio${GPIO_PORT_1}/edge

INT_1=$( get_counter_interrupt )

echo 1 > /sys/class/gpio/gpio${GPIO_PORT_2}/value

INT_2=$( get_counter_interrupt )

if [ $INT_2 -eq  $INT_1 ]; then        
    echo "CPU0 Interrupt cound is not increasing"
fi

OK=$(($OK + 1))

sleep 2

echo 0 > /sys/class/gpio/gpio${GPIO_PORT_2}/value
echo 1 > /sys/class/gpio/gpio${GPIO_PORT_2}/value

INT_3=$( get_counter_interrupt )

if [ $INT_3 -eq  $INT_2 ]; then   
    echo "CPU0 Interrupt cound is not increasing"
fi

OK=$(($OK + 1))

sleep 2

#count down
echo falling > /sys/class/gpio/gpio${GPIO_PORT_1}/edge

INT_4=$( get_counter_interrupt )

if [ $INT_4 -eq  $INT_3 ]; then
    echo "CPU0 Interrupt cound is not increasing"
fi

OK=$(($OK + 1))

sleep 2

#count both
echo both > /sys/class/gpio/gpio${GPIO_PORT_1}/edge

INT_5=$( get_counter_interrupt )

if [ $INT_5 -eq  $INT_4 ]; then  
    echo "CPU0 Interrupt cound is not increasing"
fi

OK=$(($OK + 1))

sleep 2

echo 1 > /sys/class/gpio/gpio${GPIO_PORT_2}/value
echo 0 > /sys/class/gpio/gpio${GPIO_PORT_2}/value

INT_6=$( get_counter_interrupt )

if [ $INT_6 -eq  $INT_5 ]; then    
    echo "CPU0 Interrupt cound is not increasing"
fi

OK=$(($OK + 1))

if [ "$OK" = "5" ]; then
    eval $PASS_MEG
fi

echo "unexport port gpio"
#unset gpio port
echo $GPIO_PORT_1 > /sys/class/gpio/unexport
echo $GPIO_PORT_2 > /sys/class/gpio/unexport

echo "\n***********************************************************************\n"
