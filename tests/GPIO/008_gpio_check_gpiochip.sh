#!/bin/sh
# gpio device driver autotest shell-script

set -e
#set -x

echo "\n***************************CHECK GPIO CHIP TEST*************************\n"

i=0

for gpiochip in $GPIOCHIP
do
    if ! cat /sys/class/gpio/gpiochip${gpiochip}/base | grep ${gpiochip};then
    	echo "\n ${gpiochip} base not found \n"
		eval $FAIL_MEG
		exit 1
    fi

    j=0
    for int in $GPIO_INTERRUPT
    do 
        if [ $j -eq $i ];then

            if ! cat /sys/class/gpio/gpiochip${gpiochip}/label | grep $int;then
            	echo "\n ${gpiochip} label not found \n"
        		eval $FAIL_MEG
        		exit 1
            fi
        fi
        j=$(($j + 1))
    done

    k=0
    for ngpio in $NGPIO
    do 
        if [ $k -eq $i ];then
            if ! cat /sys/class/gpio/gpiochip${gpiochip}/ngpio | grep $ngpio;then
            	echo "\n ${gpiochip} ngpio not found \n"
        		eval $FAIL_MEG
        		exit 1
            fi
        fi
        k=$(($k + 1))
    done

    i=$(($i + 1))
done

eval $PASS_MEG

echo "\n************************************************************************\n"