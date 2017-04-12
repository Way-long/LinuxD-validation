#!/bin/bash

echo "capture sound with bitrate 44100"

# format
format=s16_le
stype=wav
channel=2
recordBitrate=44100

recordF=$(basename $0)
recordF="${recordF%.sh}.wav"
$(dirname $0)/../helper/record_play_helper-.sh -f "$format" -t "$stype" -c "$channel" -rbitrate "$recordBitrate" -outf "$recordF"