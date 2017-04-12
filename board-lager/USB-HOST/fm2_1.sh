#!/bin/sh
#
TEST_TITLE="fm2_1"
USB_DEV="usbfm2"
TESTDATA_A="dmy_10K2_1"
DISPLAY_TIME=5
LOOP_TIME=900
TEST_TIME=0
START_TIME=`date +%s`
LAST_TIME=`expr ${DISPLAY_TIME} - 1`
if [ $# -ge 1 ]
then
LOOP_TIME=$1
fi
 
while [ ${TEST_TIME} -lt ${LOOP_TIME} ]
do
	dd if=/dev/zero of=/mnt/${USB_DEV}/${TESTDATA_A} bs=10M count=1
	dd if=/mnt/${USB_DEV}/${TESTDATA_A} of=/dev/null bs=10M count=1
        GET_TIME=`date +%s`
        TEST_TIME=`expr ${GET_TIME} - ${START_TIME}`
        if [ ${TEST_TIME} -gt ${LAST_TIME} ]
        then
        echo ${TEST_TIME} "sec passed by " ${TEST_TITLE}
        LAST_TIME=`expr ${LAST_TIME} + ${DISPLAY_TIME}`
        fi
done
        echo ${TEST_TITLE} " test passed."
