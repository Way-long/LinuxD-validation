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
echo " $KEY_WORDS " > ${TESTDATA}
echo "Test dir: $(pwd)"
while :
do
    printf "t(${COUNT})"

    KEY_WORDS="0123456789ABCDEFG_$COUNT"
    echo " $KEY_WORDS " > ${DEVFILE_TX}

    echo ""
    echo "Send data done, now sleep 10s"
    sleep 10

    while [ ! -f ${TESTDATA}_bbb -a ! -f ${TESTDATA}_ccc ]; do
        sleep 1
        echo "waiting until file ${TESTDATA}_bbb and ${TESTDATA}_ccc generated."
        if [ -f ${TESTDATA}_bbb -a -f ${TESTDATA}_ccc ]; then
            ls
            break
        fi
    done

    echo "Send data: $KEY_WORDS "
    echo "Recv data: "
    cat ${TESTDATA}_bbb

    if ! grep "$KEY_WORDS" ${TESTDATA}_bbb > /dev/null
    then
        echo ""
        echo "SCIF loopback test failed."
        echo "fin" > ${TESTDATA}_ccc
        exit
    fi
    echo "" > ${TESTDATA}_bbb

    GET_TIME=`date +%s`
    TEST_TIME=`expr ${GET_TIME} - ${START_TIME}`
    if [ ${TEST_TIME} -lt ${END_TIME} ]
    then
        echo "go" > ${TESTDATA}_ccc
    else
        echo "fin" > ${TESTDATA}_ccc
        break
    fi

    COUNT=`expr ${COUNT} + 1`
done

echo ""
echo "SCIF loopback test passed."
