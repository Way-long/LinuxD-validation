#!/bin/sh
# sound device driver autotest shell-script

set -e
#set -x

echo "\n**********RECORD ANS APLAY FILE SOUND BIT RATE ${BR_44100}**************\n"

$(dirname $0)/sound_record_and_aplay_file.sh $BR_44100

echo "\n************************************************************************\n"