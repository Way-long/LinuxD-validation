#!/bin/bash
cmd=$1
shift

# cmd="get /tmp/abc /tmp/def"
# source "$(dirname $0)/../config.sh"

RET=0
logF="/tmp/log.txt"
echo "[$$]> start ftp transaction"
$(dirname $0)/ftp_access.sh "$cmd" $@ > "$logF" &
pid=$!
sleep 5
echo "[$$]> interrupt process"
log=`pgrep -x "ftp" | xargs --no-run-if-empty ps fp | grep "ftp -n -v"`
intPID=`echo "$log" | awk '{print $1}'`
if [[ "$intPID" ]] ;then
	kill -INT $intPID || echo "ERROR: interrupt failed"
	wait $pid || { echo "ERROR: error code returned ($?)"; RET=$?; }
	ps -p $intPID > /dev/null && { echo "ERROR: ftp process [$intPID] still running"; kill -9 $intPID; } 
else
	echo "ERROR: no ftp process found"
fi

echo "[$$]> check login"
if cat $logF | grep -i "login successful";then
	echo "[$$]> check interrupt result"
	if cat $logF | grep -i "aborted";then
		echo "-> interrupt process successfully"
		echo "[$$]> check exit"
		if ! cat $logF | grep -i "goodbye";then
			RET=3;
			echo "ERROR: exit failed";
		fi
	else
		RET=2;
		echo "ERROR: the process was not interrupted"; 
	fi
else
	echo "ERROR: log in failed";
	RET=1;
fi

[[ "$RET" == 0 ]] && echo "Do ctrl-c: PASSED"
# cat $logF

# clean up
rm $logF

exit $RET