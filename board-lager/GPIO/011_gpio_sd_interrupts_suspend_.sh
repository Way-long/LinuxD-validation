#!/bin/bash

echo "checking gpio sd interrupt counting when inserting sd card after suspending system"

# constant
CHECK_INTERRUPT="$(dirname $0)/../common/check_interrupt_count.sh"
cache="gpio_sd1_interrupts_counting.tmp"

# todo
$(dirname $0)/../common/enable_tty_wakeup.sh $WAKEUP_PORT

#======================================= suspending the system =====================================
echo "The system is going to be suspended. After 3 seconds, wake up the system by the console..."
sleep 1
echo mem > /sys/power/state

$(dirname $0)/../common/wait_user_action.sh "Ensure that the board has at least one slot to insert the sd card then input \"next\" to continue..." "next"
gpio_sd=`$(dirname $0)/../common/get_gpio_sd.sh`


#========================================= check interrupt counting when insert a sd card ======================================
# remember interrupt state
cat /proc/interrupts  | grep -E "$gpio_sd$" > $cache

#wait user action
$(dirname $0)/../common/wait_user_action.sh "\nPlease insert the sd card then input \"next\" to continue..." "next"

#check interrupt counting
cat $cache | $CHECK_INTERRUPT 1


#========================================= check interrupt counting when remove the sd card ======================================
# remember interrupt state
cat /proc/interrupts  | grep -E "$gpio_sd$" > $cache

#wait user action
$(dirname $0)/../common/wait_user_action.sh "\n\nPlease remove the sd card then input \"next\" to continue..." "next"

#check interrupt counting
cat $cache | $CHECK_INTERRUPT 1



# clean up
rm $cache
