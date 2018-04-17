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

START_TIME=`date +%s`

if [ -n "$1" ]

then

        END_TIME=$1

else

        END_TIME=1800

fi

 

# Make testdata 1MByte

if [ ! -f ${TESTDATA} ]

then

        dd if=/dev/zero of=${TESTDATA} bs=1024 count=1024

fi

echo "Make testdata 1MByte"

stty -F ${DEVFILE_TTYS} 38400

 

while [ ${TEST_TIME} -lt ${END_TIME} ]

do

        cat ${TESTDATA} > ${DEVFILE_TTYS} || echo "ttySC send error!"

 

        GET_TIME=`date +%s`

        TEST_TIME=`expr ${GET_TIME} - ${START_TIME}`

done

echo "ttySC send successfully."
