#!/bin/sh
# sound device driver autotest shell-script

set -a
#set -x

amixer set 'DVC Out Mute' off ;
amixer set 'DVC In Mute' off;
amixer set "DVC Out" 20%;
amixer set "DVC In" 20%;