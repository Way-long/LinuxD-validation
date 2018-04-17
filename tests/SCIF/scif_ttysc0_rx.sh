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

cat ${DEVFILE_RX} > ${TESTDATA}_bbb &

while :
do
	touch ${TESTDATA}_ccc || exit

	while :
	do
		read GET_SRT < ${TESTDATA}_ccc
		if [ "${GET_SRT}" == "go" ]
		then
			rm ${TESTDATA}_ccc
			break
		fi
		if [ "${GET_SRT}" == "fin" ]
		then
			echo ""
			rm ${TESTDATA}_ccc
			exit
		fi
	done
done
