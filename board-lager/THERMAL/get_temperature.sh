#!/bin/bash

read line < <(sensors | grep temp)
line=${line##* }
t=${line%%[^0-9+-]*}
# t=${line%%[^0-9+-.]*}
echo "$t"