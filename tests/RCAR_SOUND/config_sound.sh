#!/bin/sh
# sound device driver autotest shell-script

set -a
#set -x

. $(dirname $0)/../../boards-conf/def_configs

# config file shell script
DRIVER="rcar_sound"			# rcar sound driver name of renesas
#SOUND_INTERRUPT="ec500000.sound"    	# interrupt of rcar sound
DRIVER_PATH="RCAR_SOUND"		# path driver for run test
LOGFILE="sound.txt"			# log file

APLAY_WAV_FILE="$SHELL_SOURCE_CODE/$DRIVER_PATH/data/test.wav"    	# file test aplay
RECORD_WAV_FILE="/tmp/record.wav"  	# file test record
