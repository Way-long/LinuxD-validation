#!/bin/bash
ON_BOARD_PATH=`$(dirname $0)/../common/path_helper.sh`

# 
ssh $SSH_AUTHEN "$ON_BOARD_PATH/enable_tty_wakeup.sh $WAKEUP_PORT"
# 
echo 'suspend the system'
ssh $SSH_AUTHEN "$ON_BOARD_PATH/suspend.sh" &
pid=$!
sleep 3
# test
WAIT_TIME=600
current_time=`date +%s`
((target_time=$current_time+$WAIT_TIME))
while [[ "$current_time" -le "$target_time" ]]; do
	if ! ssh -o ConnectTimeout=3 $SSH_AUTHEN "echo probe" ; then
		echo "system suspended..."
		sleeping=true
		break
	fi
	sleep 10

	current_time=`date +%s`
done

if "$sleeping" ; then
	echo "wake up the system"
	if [[ -n "$SUDO_PW" ]]; then
		echo "$SUDO_PW" | sudo -S sh -c "echo ' ' > '$WAKEUP_BY'"
		echo ""
	else
		sudo sh -c "echo ' ' > '$WAKEUP_BY'"
	fi
	sleep 3
	# check again
	if ssh $SSH_AUTHEN "echo wakeup" ; then
		echo "the system waked up"
	else
		echo "ERROR: cannot wake the system up"
	fi
else
	echo "ERROR: suspend failed"
fi

if ps -p $pid > /dev/null;then
	echo "wait $pid"
	wait $pid
fi