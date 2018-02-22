#!/bin/sh
# dma device driver autotest shell-script

set -e
#set -x

if [ $# -ne 1 ]; then
	echo "usage: $(basename $0) DMA_INTERRUPT" >&2
	exit 1
fi

INT="$1"

#RUN

cmd="echo 32 > /sys/module/dmatest/parameters/iterations"
echo $cmd
sleep 1

if ! eval $cmd ;then 
	echo "please modprobe module before test this item"
	exit 1
fi

cmd="echo 100000 > /sys/module/dmatest/parameters/timeout"
echo $cmd
sleep 1

if ! eval $cmd ;then
	exit 1
fi	

cmd="echo ${INT}-controller > /sys/module/dmatest/parameters/device"
echo $cmd
sleep 1

if ! eval $cmd ;then
	exit 1
fi

cmd="echo 1 > /sys/module/dmatest/parameters/run"
echo $cmd
sleep 1

if ! eval $cmd ;then
	exit 1
fi

sleep 1

