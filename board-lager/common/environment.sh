#!/bin/bash

# config
source "$(dirname $0)/../config.sh"

if [[ `whoami` == "root" ]]; then
        if uname -a | grep -io "$ENV_BOARD" > /dev/null; then
                ENV="board"
        elif uname -a | grep -io "$ENV_PC" > /dev/null; then
                ENV="pc"
        else
                echo "unknown environment"
                exit 1
        fi
else
        ENV="pc"
fi
echo "$ENV"