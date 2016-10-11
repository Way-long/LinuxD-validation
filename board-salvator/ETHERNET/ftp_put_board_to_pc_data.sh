#!/bin/sh
# ethernet device driver autotest shell-script

set -a
#set -x

if [ $# -gt 1 ]; then
    echo "usage: $(basename $0) SIZE_DATA(MB)" >& 2
    echo "example: $(basename $0) 100"
    echo "default: 300MB"
    exit 1
fi

if [ $# -eq 1 ]; then
	SIZE_DATA="$1"
else
	SIZE_DATA=300
fi

LOGFILE=`echo $SIZE_DATA$LOGFILE`

echo "prepare data for test"

if ! [ -f "$(dirname $0)/data/file-${SIZE_DATA}mb" ]; then
	dd if=/dev/urandom of=/tmp/file-${SIZE_DATA}mb bs=1M count=${SIZE_DATA}
else
	cp $(dirname $0)/data/file-${SIZE_DATA}mb /tmp
	sync
fi

if [ -f "/tmp/file-${SIZE_DATA}mb" ];then
	echo "prepare data successfully"
else
	echo "prepare data not successfully"
	eval $FAIL_MEG
	exit 1;	
fi

echo "login server PC and tranfer data file"

ftp -inv $IPSERVER > $LOGFILE 2>&1 <<END_SCRIPT

	quote USER $PCNAME
	quote PASS $PCPASSWORD

	put /tmp/file-${SIZE_DATA}mb $PC_FOLDER/file-${SIZE_DATA}mb

	quit

END_SCRIPT

cat $LOGFILE

echo "end tranfer data file"

if cat $LOGFILE | grep -i "Transfer complete" > /dev/null;then
	eval $PASS_MEG
else
	cat $LOGFILE
	eval $FAIL_MEG
fi 

if [ -f $LOGFILE ];then
    rm -rf $LOGFILE
fi

rm -rf /tmp/*