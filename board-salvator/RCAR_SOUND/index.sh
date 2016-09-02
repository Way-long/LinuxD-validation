#!/bin/sh
# sound device driver autotest shell-script

set -a
#set -x

case "$1" in

1)
$(dirname $0)/exec_sound.sh 001_sound_check_dmesg.sh
sleep 3
;;

2) 
$(dirname $0)/exec_sound.sh 002_sound_check_interrupt.sh
sleep 3
;;

3) 
$(dirname $0)/exec_sound.sh 003_sound_check_interface_device.sh
sleep 3
;;

4) 
$(dirname $0)/exec_sound.sh 004_sound_aplay_file.sh
sleep 3
;;

5) 
$(dirname $0)/exec_sound.sh 005_sound_record_aplay_file.sh
sleep 3
;;

6) 
$(dirname $0)/exec_sound.sh 006_sound_record_aplay_file_bit_rate_8000.sh
sleep 3
;;

7) 
$(dirname $0)/exec_sound.sh 007_sound_record_aplay_file_bit_rate_12000.sh
sleep 3
;;

8) 
$(dirname $0)/exec_sound.sh 008_sound_record_aplay_file_bit_rate_16000.sh
sleep 3
;;

9) 
$(dirname $0)/exec_sound.sh 009_sound_record_aplay_file_bit_rate_24000.sh
sleep 3
;;

10) 
$(dirname $0)/exec_sound.sh 010_sound_record_aplay_file_bit_rate_32000.sh
sleep 3
;;

11) 
$(dirname $0)/exec_sound.sh 011_sound_record_aplay_file_bit_rate_44100.sh
sleep 3
;;

12) 
$(dirname $0)/exec_sound.sh 012_sound_record_aplay_file_bit_rate_48000.sh
sleep 3
;;

13) 
$(dirname $0)/exec_sound.sh 013_sound_volume_up_down_output.sh
sleep 3
;;

14) 
$(dirname $0)/exec_sound.sh 014_sound_record_repeatedly.sh
sleep 3
;;

15) 
$(dirname $0)/exec_sound.sh 015_sound_aplay_repeatedly.sh
sleep 3
;;

16) 
$(dirname $0)/exec_sound.sh 016_sound_suspend_while_aplay.sh 1
sleep 3
;;

17) 
$(dirname $0)/exec_sound.sh 017_sound_unbind_bind_device.sh
sleep 3
;;

18) 
$(dirname $0)/exec_sound.sh 018_sound_record_while_aplay.sh
sleep 3
;;

19) 
$(dirname $0)/exec_sound.sh 019_sound_aplay_while_record.sh
sleep 3
;;

20) 
$(dirname $0)/exec_sound.sh 020_sound_ctr+c_aplay.sh
sleep 3
;;

21) 
$(dirname $0)/exec_sound.sh 021_sound_ctr+c_record.sh
sleep 3
;;

22) 
$(dirname $0)/exec_sound.sh 022_sound_ctr+z_aplay.sh
sleep 3
;;

23) 
$(dirname $0)/exec_sound.sh 023_sound_ctr+z_record.sh
sleep 3
;;

24) 
$(dirname $0)/exec_sound.sh 024_sound_volume_up_down_aplay.sh
sleep 3
;;

25) 
$(dirname $0)/exec_sound.sh 025_sound_volume_up_down_record.sh
sleep 3
;;

26) 
$(dirname $0)/exec_sound.sh 026_sound_smp_multiple_cpu.sh
sleep 3
;;

27) 
$(dirname $0)/exec_sound.sh 027_sound_stress_cpu.sh
sleep 3
;;

esac