#!/bin/sh
# dma device driver autotest shell-script

set -e
#set -x

echo "\n************************DMAE CHECK DMA CHAN TEST************************\n"

for a in $(seq 0 $DMA5CHAN);
do
	if ! ls /sys/class/dma | grep dma5chan$a; then
		echo "missing dma0chan$a"
		eval $FAIL_MEG	
		exit 1
	fi	
done	

eval $PASS_MEG

echo "\n************************************************************************\n"
