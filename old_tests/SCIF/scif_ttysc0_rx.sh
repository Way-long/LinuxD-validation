#!/bin/sh
#
# ttySC0 -> bbb
#

### Configuration ###
TESTDATA="testdata"
DEVFILE_RX="/dev/ttySC0"

### Test Main ###
rm -f ${TESTDATA}_bbb
rm -f ${TESTDATA}_ccc

while :
do
	cat ${DEVFILE_RX} > ${TESTDATA}_bbb &&
	printf "r" &&
	touch ${TESTDATA}_ccc || exit

	while :
	do
		read GET_SRT < ${TESTDATA}_ccc
		if [ "${GET_SRT}" == "go" ]
		then
			break
		fi
		if [ "${GET_SRT}" == "fin" ]
		then
			echo ""
			exit
		fi
	done
done