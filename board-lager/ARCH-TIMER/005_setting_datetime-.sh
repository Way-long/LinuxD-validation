#!/bin/bash
echo "Setting date time for System"

echo "set datetime for the board"
now=`date '+%Y-%m-%d %T'`
ssh $SSH_AUTHEN "date -s '$now'"
echo "sleep 1 minute then check time updating"
sleep 60
#check date
FORMAT="+%Y-%m-%d %H:%M"
onboard_time=`ssh $SSH_AUTHEN "date '$FORMAT'"`
now=`date "$FORMAT"`
echo "$now"
if [[ "$now" == "$onboard_time" ]]; then
	echo -e "\nPASSED"
else
	echo "check again"
	sleep 2
	onboard_time=`ssh $SSH_AUTHEN "date '$FORMAT'"`
	if [[ "$now" == "$onboard_time" ]]; then
		echo -e "\nPASSED"
	else
		echo "Time differrent:"
		echo "NOW         : $now"
		echo "ONBOARD_TIME: $onboard_time"
		echo -e "\nFAILED"
	fi
fi
