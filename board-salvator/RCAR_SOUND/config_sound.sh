#!/bin/sh
# sound device driver autotest shell-script

set -a
#set -x

. $(dirname $0)/../config.sh

# config file shell script
DRIVER="rcar_sound"				    # rcar sound driver name of renesas
INTERRUPT="ec500000.sound"          # interrupt of rcar sound
DRIVER_PATH="RCAR_SOUND"			# path driver for run test						
LOGFILE="dma.txt"					# log file

APLAY_WAV_FILE="./data/test.wav"    # file test aplay 
RECORD_WAV_FILE="/home/record.wav"  # file test record

# grep command to kill process
APLAY_CMD="aplay -f cd"			    
RECORD_CMD="arecord -f cd" 	

# bit rate support
BR_8000="8000"
BR_12000="12000"
BR_16000="16000"
BR_24000="24000"
BR_32000="32000"
BR_44100="44100"
BR_48000="48000"

# setting volume to test
$(dirname $0)/sound_setting_volume.sh > /dev/null