#!/bin/sh

set -a
#set -x

. ./config_sdhi.sh

echo "================================================================================="
echo "|                               TEST SDHI DRIVER                                |"
echo "================================================================================="
#Simultaneously
echo "48)*******************Simultaneously-Write-RAM-to-SD1_SD2************************"
$(dirname $0)/Simultaneously-Write-RAM-to-SD1_SD2.sh
sleep 3

echo "49)*******************Simultaneously-Write-SD1_SD2-to-RAM************************"
$(dirname $0)/Simultaneously-Write-SD1_SD2-to-RAM.sh
sleep 3

echo "50-51)*******************Simultaneously-Write-RAM-SD1****************************"
$(dirname $0)/Simultaneously-Write-RAM-SD1.sh
sleep 3

echo "52-53)*******************Simultaneously-Write-RAM-SD2****************************"
$(dirname $0)/Simultaneously-Write-RAM-SD2.sh
sleep 3

echo "54)**********************Simultaneously-Write-SD1-SD2****************************"
$(dirname $0)/Simultaneously-Write-SD1-SD2.sh
sleep 3

# echo "65)************************write speed for SD1 *********************************"
# $(dirname $0)/write-speed-SD1.sh
# sleep 3

# echo "66)*************************read speed for SD1 *********************************"
# $(dirname $0)/read-speed-SD1.sh
# sleep 3

# echo "67)************************write speed for SD2 *********************************"
# $(dirname $0)/write-speed-SD2.sh
# sleep 3

# echo "68)*************************read speed for SD2 *********************************"
# $(dirname $0)/read-speed-SD2.sh
# sleep 3

echo "81)*************************unbind-bind-write-sdhi.0****************************"
$(dirname $0)/unbind-bind-write-sdhi.1.sh
sleep 3
$(dirname $0)/unbind-bind-write-sdhi.2.sh 
sleep 3 

echo "***************************create-partion-ext3-system again**********************"
$(dirname $0)/create-partion-ext3-system-SD1.sh 
sleep 3
$(dirname $0)/create-partion-ext3-system-SD2.sh
sleep 3

# echo "82)*************************ctr_c while copy file ******************************"
# $(dirname $0)/ctr_c-write-RAM-to-SD1.sh
# sleep 3
# $(dirname $0)/ctr_c-write-RAM-to-SD2.sh
# sleep 3

# echo "83)*************************ctr_z while copy file ******************************"
# $(dirname $0)/ctr_z-write-RAM-to-SD1.sh
# sleep 3
# $(dirname $0)/ctr_z-write-RAM-to-SD2.sh
# sleep 3

# echo "84-85)*********************clkgate-read-write-mmc******************************"
# $(dirname $0)/clkgate-read-write-mmc.sh
# sleep 3

# echo "89)***********************smp-cpu0_0-write-ram-sdhi0_1**************************"
# $(dirname $0)/smp-multicpu-1SD.sh
# sleep 3

echo "90)***********************smp-cpu0_0-write-ram-sdhi0_1**************************"
$(dirname $0)/smp-multicpu-mutilSD.sh
sleep 3

# echo "91)***********************smp-cpu0_0-write-ram-sdhi0_1**************************"
# $(dirname $0)/smp-1cpu-multiSD.sh
# sleep 3


