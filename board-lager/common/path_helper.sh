#!/bin/bash

caller="$(ps -o command= -p "$PPID" | awk '{print $2}')"
absolutePath=`readlink -m $caller`
absolutePath=${absolutePath%/*}
path=${absolutePath#$SSH_ROOT_PATH}
echo "$path"