#!/bin/sh
# sound device driver autotest shell-script

set -e
#set -x

echo "\n**********RECORD ANS APLAY FILE SOUND BIT RATE ${BR_12000}**************\n"

$(dirname $0)/sound_record_and_aplay_file.sh $BR_12000

echo "\n************************************************************************\n"