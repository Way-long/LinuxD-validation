#!/bin/sh
# sound device driver autotest shell-script

set -e
#set -x

amixer set 'DVC Out Mute' off;
amixer set 'DVC In Mute' off;
amixer set "DVC Out" 50%;
amixer set "DVC In" 50%;