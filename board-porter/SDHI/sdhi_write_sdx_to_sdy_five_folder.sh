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

echo "\n************************WRITE FOLDER INSIDE 2 SDHI**********************\n"

$(dirname $0)/sdhi_copy_folder.sh $SRC_DIR $DST_DIR 5

echo "\n************************************************************************\n"