#!/bin/sh
#
# SCIF test program
# send testdata_1MB to /dev/ttySC0
#

### Configuration ###
TESTDATA="testdata_1MB"
DEVFILE_TTYS="/dev/ttySC0"

### Test Main ###
TEST_TIME=0
COUNT=0
START_TIME=`date +%s`
if [ -n "$1" ]
        then
        END_TIME=$1
else
        END_TIME=1200
fi

# Make testdata 1MByte

if [ ! -f ${TESTDATA} ];then
        echo "Make testdata 1MByte"
        echo "<<<<" > ${TESTDATA}
        # < /dev/urandom tr -dc "[:alnum:]" | head -c1000000 > ${TESTDATA}
        < /dev/urandom tr -dc "[:alnum:]" | head -c100000 > abc
        for i in $(seq 1 10);do
                cat abc >> ${TESTDATA}
                echo "" >> ${TESTDATA}
        done
        rm abc
        echo "\n>>>" >> ${TESTDATA}
fi

# stty -F ${DEVFILE_TTYS} 115200

echo "start...."
while [ ${TEST_TIME} -lt ${END_TIME} ]
do
        echo "Begin write data to $DEVFILE_TTYS"
        cat ${TESTDATA} > ${DEVFILE_TTYS} || echo "ttySC send error!"
        GET_TIME=`date +%s`
        TEST_TIME=`expr ${GET_TIME} - ${START_TIME}`
        echo "$TEST_TIME"
        echo "End write data to $DEVFILE_TTYS"
        COUNT=$(($COUNT+1))
        echo "Write successful: $COUNT"
done
echo "done."

