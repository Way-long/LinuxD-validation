#!/bin/sh
# ethernet device driver autotest shell-script

set -e
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

#check file on host pc
ftp -inv $IPSERVER > $LOGFILE 2>&1 <<END_SCRIPT

quote USER $PCNAME
quote PASS $PCPASSWORD

ls $PC_FOLDER

quit

END_SCRIPT
#---------

if grep -i "file-${SIZE_DATA}mb" $LOGFILE >/dev/null;then
	echo "prepare data successfully"
else
	echo "prepare data not successfully"
	eval $FAIL_MEG
	exit 1;	
fi

if [ -f $LOGFILE ];then
    rm -rf $LOGFILE
fi 

echo "login server PC and tranfer data file"

ftp -inv $IPSERVER > $LOGFILE 2>&1 <<END_SCRIPT

	quote USER $PCNAME
	quote PASS $PCPASSWORD

	get $PC_FOLDER/file-${SIZE_DATA}mb /tmp/file-${SIZE_DATA}mb 

	quit

END_SCRIPT

echo "end tranfer data file"

if grep -i "Transfer complete" $LOGFILE >/dev/null;then
	eval $PASS_MEG
else
	eval $FAIL_MEG
fi 

if [ -f $LOGFILE ];then
    rm -rf $LOGFILE
fi
