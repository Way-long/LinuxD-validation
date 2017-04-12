#!/bin/bash

stressTime=$1

# calculate
cpu=0
for i in "/sys/devices/system/cpu/cpu"[0-9]"/cpufreq/scaling_governor" ; do
	((cpu++))
done
((io=$cpu*2))
vm=$cpu

# 
echo "[$$]> do stress on $cpu CPU $io IO $vm VM in $stressTime"
stress --cpu "$cpu" --io "$io" --vm "$vm" --vm-bytes 20M --timeout "$stressTime"