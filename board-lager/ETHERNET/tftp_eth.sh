#!/bin/bash

# arguments
host=$1
if [[ ! "$host" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
	host=$IP_HOST_PC
fi
if [[ ! "$host" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
	echo "No host specified. use default: 172.16.1.45"
	host=172.16.1.45
fi
timeout=60
file_size=10

# options
i=1
while [[ "$i" -le "$#" ]]; do
	if [[ ${!i} == "-timeout" ]];then ((i++)); timeout=${!i}; 
	fi
	((i++))
done
# declaration

ORIGINAL_FILE="/tmp/$$_original"
PC_FILE="/export/$$_remote.dat"
BOARD_FILE="/tmp/$$_source"

echo "[$$] create file"
dd if=/dev/urandom of="$ORIGINAL_FILE" bs=1M count=10 > /dev/null 2>&1
count=1
cp "$ORIGINAL_FILE" "$BOARD_FILE$count"

echo "[$$] tranfering file..."
current_time=`date +%s`
((target_time=$current_time+$timeout))
while [[ "$current_time" -le "$target_time" ]]; do

	echo "put $BOARD_FILE$count ${PC_FILE}" | tftp $host > /dev/null 2>&1
	((next=$count+1))
	echo "get ${PC_FILE} ${BOARD_FILE}${next}" | tftp $host > /dev/null 2>&1
	rm "$BOARD_FILE$count"
	count=$next

	current_time=`date +%s`
done

RET=0
cmp "$ORIGINAL_FILE" "$BOARD_FILE$count" && echo "[$$] PASSED" || { echo "[$$] FAILED"; RET=1; }

# clean up
rm "$ORIGINAL_FILE"
rm "$BOARD_FILE$count"

exit $RET