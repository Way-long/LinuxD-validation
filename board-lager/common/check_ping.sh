#!/bin/bash

target=$1

if [[ ! -n "$target" ]]; then
	target="google.com"
fi

if ping -c 5 $target > /dev/null; then
	echo "Ping from Board -> [$target]: Passed"
else
	echo "Ping from Board -> [$target]: Failed"
fi

