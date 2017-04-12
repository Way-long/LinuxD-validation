#!/bin/sh
#
TEST_TITLE="fm1"
USB_DEV="usbfm"
TESTDATA="dmy_10K1"
TESTDATA_A="dmy_10K1_1"
TESTDATA_B="dmy_10K1_2"
DISPLAY_TIME=5
LOOP_TIME=900
TEST_TIME=0
START_TIME=`date +%s`
LAST_TIME=`expr ${DISPLAY_TIME} - 1`
if [ $# -ge 1 ]
then
LOOP_TIME=$1
fi
dd if=/dev/zero of=/home/root/${TESTDATA} bs=1024 count=10
dd if=/home/root/${TESTDATA} of=/home/root/${TESTDATA_A} bs=1024 count=10
 
while [ ${TEST_TIME} -lt ${LOOP_TIME} ]
do
	dd if=/home/root/${TESTDATA_A} of=/mnt/${USB_DEV}/${TESTDATA_A} bs=1024 count=10
	dd if=/mnt/${USB_DEV}/${TESTDATA_A} of=/home/root/${TESTDATA_B} bs=1024 count=10
	rm /home/root/${TESTDATA_A}
	mv /home/root/${TESTDATA_B} /home/root/${TESTDATA_A}
        GET_TIME=`date +%s`
        TEST_TIME=`expr ${GET_TIME} - ${START_TIME}`
        if [ ${TEST_TIME} -gt ${LAST_TIME} ]
        then
        echo ${TEST_TIME} "sec passed by " ${TEST_TITLE}
        LAST_TIME=`expr ${LAST_TIME} + ${DISPLAY_TIME}`
        fi
done
if cmp /home/root/${TESTDATA} /home/root/${TESTDATA_A}
then
        echo ${TEST_TITLE} " test passed."
else
        echo ${TEST_TITLE} " test failed."
fi
