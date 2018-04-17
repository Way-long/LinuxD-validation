#!/bin/sh
# sound device driver autotest shell-script

set -a
#set -x

amixer set 'LINEOUT Mixer DACL' off ;
amixer set 'LINEOUT Mixer DACL' off;
amixer set "Digital" 20%;
amixer set "Digital" 20%;
