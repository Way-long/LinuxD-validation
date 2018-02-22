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

echo "login server PC and tranfer data file"

ftp -inv $IPSERVER > $LOGFILE 2>&1 <<END_SCRIPT

	quote USER $PCNAME
	quote PASS $PCPASSWORD

	put ${RAM_DIR}/file-${SIZE_DATA}mb $PC_FOLDER/file-${SIZE_DATA}mb

	quit

END_SCRIPT

cat $LOGFILE

echo "end tranfer data file"

if cat $LOGFILE | grep -i "Transfer complete" > /dev/null;then
	eval $PASS_MEG
else
	eval $FAIL_MEG
fi 

if [ -f $LOGFILE ];then
    rm -rf $LOGFILE
fi