#!/bin/bash

ENV=`$(dirname $0)/environment.sh`

if [[ "$ENV" == "pc" ]]; then
        source "$(dirname $0)/../config.sh"
        caller="$(ps -o command= -p "$PPID" | awk '{print $2}')"
        absolutePath=`readlink -m $caller`
        absolutePath=${absolutePath%/*}
        path=${absolutePath#$SSH_ROOT_PATH}
        ssh $SSH_AUTHEN "$path/$1"
elif [[ "$ENV" == "board" ]]; then
        caller="$(ps -o command= -p "$PPID" | awk '{print $2}')"
        $(dirname $caller)/$1
else
        echo "ERROR: unknown environment!!!"
fi


