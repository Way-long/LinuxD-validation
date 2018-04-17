#!/bin/bash
# sdhi device driver autotest shell-script

set -e
#set -x

if [ $# -lt 2 ]; then
    echo "usage : $(basename $0) SDHI_DIRECTORY1 SDHI_DIRECTORY2"
    exit 1
fi

SRC_DIR="$1"
DST_DIR="$2"

echo "\n************************WRITE DATA INSIDE 2 SDHI************************\n"

$(dirname $0)/sdhi_copy_data.sh $SRC_DIR $DST_DIR 10

echo "\n************************************************************************\n"