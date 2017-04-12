#!/bin/bash
# this program is run in /root. Please login /root with 'su' command

port="$1"
find /sys/devices/ | grep -E "wakeup$" | grep "$port" | {
	while read path; do
		if [[ "$path" == *"wakeup" ]]; then
			echo "Enable: echo enabled > $path"
			if ! echo "enabled" > "$path";then
				echo "ERROR: cannot enable $path"
			fi
		fi
	done
}
