#!/bin/bash
# timer device driver autotest shell-script

set -e
#set -x

echo "\n**********************SETTING TIME FOR SYSTEM***************************\n"

year=2015
month=01
date=25
hour=10
minutes=11
seconds=12

echo "prepare date is $year/$month/$date $hour:$minutes"

#setup date
echo "setup date"
busybox date $month$date$hour$minutes$year
sleep 5
#check date
tmpYear=`date +'%Y/%m/%d' | cut -c1-4`
tmpMonth=`date +'%Y/%m/%d' | cut -c6-7`
tmpDate=`date +'%Y/%m/%d' | cut -c9-10`

tmpHour=`date | cut -c12-13`
tmpMinutes=`date | cut -c15-16`
tmpSeconds=`date | cut -c18-19`

if [ $year -eq $tmpYear ] && [ $month -eq $tmpMonth ] && [ $date -eq $tmpDate ] && [ $hour -eq $tmpHour ] && [ $minutes -eq $tmpMinutes ]; then
	eval $PASS_MEG
else
	eval $FAIL_MEG
fi

echo "\n************************************************************************\n"
