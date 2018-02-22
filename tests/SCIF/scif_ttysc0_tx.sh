#!/bin/sh

set -e
#set -x

TESTDATA="testdata"
DEVFILE_TX="/dev/ttySC0"
TEST_TIME=0
START_TIME=`date +%s`
if [ -n "$1" ]
then
    END_TIME=$1
else
    END_TIME=3600
fi
COUNT=1
# Make testdata as text file
echo "0123456789ABCDEFG" > ${TESTDATA}
cp ${TESTDATA} ${TESTDATA}_aaa
while :
do
    printf "t(${COUNT})"
    cat ${TESTDATA}_aaa > ${DEVFILE_TX} &&
    sleep 5
    cat EOF > ${DEVFILE_TX}
    sleep 1

    until [ -f ${TESTDATA}_bbb -a -f ${TESTDATA}_ccc ]
    do
        :
    done
    TEST_STR=`cat ${TESTDATA}_bbb | tr -d '\012'`
    echo ${TEST_STR} > ${TESTDATA}_aaa
 
    if ! cmp ${TESTDATA} ${TESTDATA}_aaa
    then
        echo ""
        echo "SCIF loopback test failed."
        echo "fin" > ${TESTDATA}_ccc
        exit
    fi
    rm -f ${TESTDATA}_bbb
 
    GET_TIME=`date +%s`
    TEST_TIME=`expr ${GET_TIME} - ${START_TIME}`
    if [ ${TEST_TIME} -lt ${END_TIME} ]
    then
        echo "go" > ${TESTDATA}_ccc
    else
        echo "fin" > ${TESTDATA}_ccc
        break
    fi
 
    ELAPS_MS=0
    read START_MS dummy < /proc/uptime
    while [ ${ELAPS_MS} -lt 100 ]
    do
        read GET_MS dummy < /proc/uptime
        ELAPS_MS=`expr ${GET_MS/./}0 - ${START_MS/./}0`
    done
    rm -f ${TESTDATA}_ccc
    COUNT=`expr ${COUNT} + 1`
done
 
echo ""
echo "SCIF loopback test passed."