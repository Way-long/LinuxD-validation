#!/bin/bash


for i in 1 2 3 4 5; do
        if echo mem > /sys/power/state;then
                echo "suspend successfully"
                exit 0
        else
                echo "WARNING $i: suspend error"
        fi
        sleep 3
done
echo "ERROR: suspend error"
exit 1