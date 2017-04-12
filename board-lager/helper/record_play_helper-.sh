#!/bin/bash

# arguments
recordTime=15
recordF="r_temp.wav"
# option
phelp(){
	echo "usage: $(basename $0) [option]"
	echo "options:"
	echo "-f: format (s16_le, ...)"
	echo "-t: type (wav, ...)"
	echo "-c: channels (1, 2, ...)"
	echo "-rbitrate: record bitrate (44100, ...)"
	echo "-pbitrate: play back bitrate (44100, ...)"
	echo "-rtime: time in second (60, 90, ...)"
	echo "-outf: result file"
}
i=1
while [[ "$i" -le "$#" ]]; do
	if [[ ${!i} == "-f" ]];then ((i++)); format=${!i}; fi
	if [[ ${!i} == "-t" ]];then ((i++)); stype=${!i}; fi
	if [[ ${!i} == "-c" ]];then ((i++)); channel=${!i}; fi
	if [[ ${!i} == "-rbitrate" ]];then ((i++)); rbitrate=${!i}; fi
	if [[ ${!i} == "-pbitrate" ]];then ((i++)); pbitrate=${!i}; fi
	if [[ ${!i} == "-rtime" ]];then ((i++)); recordTime=${!i}; fi
	if [[ ${!i} == "-outf" ]];then ((i++)); recordF=${!i}; fi
	# ...........................................................
	if [[ ${!i} == "-h" ]];then ((i++)); phelp;exit 0; fi
	((i++))
done


# ================================  to do ====================================================
r_args=""
p_args=""
if [[ -n "$format" ]]; then
	r_args="$r_args -f '$format'"
	p_args="$p_args -f '$format'"
fi
if [[ -n "$stype" ]]; then
	r_args="$r_args -t '$stype'"
	p_args="$p_args -t '$stype'"
fi
if [[ -n "$channel" ]]; then
	r_args="$r_args -c '$channel'"
	p_args="$p_args -c '$channel'"
fi
if [[ -n "$rbitrate" ]]; then
	r_args="$r_args -r '$rbitrate'"
fi
if [[ -n "$pbitrate" ]]; then
	p_args="$p_args -r '$pbitrate'"
elif [[ -n "$rbitrate" ]]; then
	p_args="$p_args -r '$rbitrate'"
fi

# echo "arecord $r_args -d $recordTime $recordF"
# echo "aplay $p_args $recordF"

$(dirname $0)/../common/play_sound-.sh $recordTime &
pid=$!

ssh $SSH_AUTHEN "arecord $r_args -d $recordTime $recordF"
if ps -p $pid > /dev/null;then
	echo "waiting playing thread $pid"
	wait $pid
fi

# listen
$(dirname $0)/../common/record_sound-.sh $recordTime $recordF &
pid=$!
echo "record finished. now playing..."
ssh $SSH_AUTHEN "aplay $p_args $recordF"

if ps -p $pid > /dev/null;then
	echo "waiting record thread $pid"
	wait $pid
fi
