
echo "checking smp concurrent access: cpu 0 process 97,120"


# echo -e "Now is $(date)\n"
background_process=gpio_out_97.sh
while [[ $(pgrep $background_process) ]]; do
	pid=$(pgrep $background_process)
 	echo "WARNING:  [$pid]$background_process is running. now killing it..."
 	pkill "$background_process"
 	sleep 1
 	if ps -p $pid > /dev/null;then
		echo "can NOT kill $pid"
		exit 1
	fi
done


taskset -c 0 $(dirname $0)/$background_process 600 &
pid=$!
sleep 1
taskset -c 0 $(dirname $0)/gpio_out_120.sh 600

if ps -p $pid > /dev/null;then
	echo "waiting $pid"
	wait $pid
fi

echo -e "\n\nPASSED"