#!/bin/bash

echo "checking gpio sd interrupt counting when inserting sd card 1"

# constant
CHECK_INTERRUPT="$(dirname $0)/../common/check_interrupt_count.sh"
cache="gpio_sd1_interrupts_counting.tmp"

# todo
$(dirname $0)/../common/wait_user_action.sh "Ensure that there are ONLY ONE card inserted into the board then input \"next\" to continue..." "next"
gpio_sd=`$(dirname $0)/../common/get_gpio_sd.sh`


#========================================= check interrupt counting when insert a sd card ======================================
# remember interrupt state
cat /proc/interrupts  | grep -E "$gpio_sd$" > $cache

#wait user action
$(dirname $0)/../common/wait_user_action.sh "\nPlease INSERT the sd card 1 then input \"next\" to continue..." "next"

#check interrupt counting
cat $cache | $CHECK_INTERRUPT 1


#========================================= check interrupt counting when remove the sd card ======================================
# remember interrupt state
cat /proc/interrupts  | grep -E "$gpio_sd$" > $cache

#wait user action
$(dirname $0)/../common/wait_user_action.sh "\n\nPlease REMOVE the sd card 1 then input \"next\" to continue..." "next"

#check interrupt counting
cat $cache | $CHECK_INTERRUPT 1



# clean up
rm $cache
