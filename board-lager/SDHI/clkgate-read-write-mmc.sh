#!/bin/sh

set -e
#set -x

OK=0
NG=0

echo "check read write clkgate"

#check read initial clkgate mmcXX
CLK_GATE="`cat /sys/class/mmc_host/mmc0/clkgate_delay`"

if [ $CLK_GATE -eq 0 ] ; then
	echo "Check read initial clkgate mmc0 passed"
        OK=$(($OK + 1))
else
	echo "Check read initial clkgate mmc0 failed"
	NG=$(($NG + 1))
fi

CLK_GATE="`cat /sys/class/mmc_host/mmc1/clkgate_delay`"

if [ $CLK_GATE -eq 0 ] ; then
	echo "Check read initial clkgate mmc1 passed"
        OK=$(($OK + 1))
else
	echo "Check read initial clkgate mmc1 failed"
	NG=$(($NG + 1))
fi

CLK_GATE="`cat /sys/class/mmc_host/mmc2/clkgate_delay`"

if [ $CLK_GATE -eq 0 ] ; then
	echo "Check read initial clkgate mmc2 passed"
        OK=$(($OK + 1))
else
	echo "Check read initial clkgate mmc2 failed"
	NG=$(($NG + 1))
fi

#check read/write clkgate mmcXX
echo 10000 > /sys/class/mmc_host/mmc0/clkgate_delay
echo 10000 > /sys/class/mmc_host/mmc1/clkgate_delay
echo 10000 > /sys/class/mmc_host/mmc2/clkgate_delay

CLK_GATE="`cat /sys/class/mmc_host/mmc0/clkgate_delay`"
if [ $CLK_GATE -eq 10000 ] ; then
	echo "Check write-read clkgate mmc0 passed"
        OK=$(($OK + 1))
else
	echo "Check write-read clkgate  mmc0 failed"
	NG=$(($NG + 1))
fi

CLK_GATE="`cat /sys/class/mmc_host/mmc1/clkgate_delay`"

if [ $CLK_GATE -eq 10000 ] ; then
	echo "Check write-read clkgate mmc1 passed"
        OK=$(($OK + 1))
else
	echo "Check write-read clkgate mmc1 failed"
	NG=$(($NG + 1))
fi

CLK_GATE="`cat /sys/class/mmc_host/mmc2/clkgate_delay`"

if [ $CLK_GATE -eq 10000 ] ; then
	echo "Check write-read clkgate mmc2 passed"
        OK=$(($OK + 1))
else
	echo "Check write-read clkgate mmc2 failed"
	NG=$(($NG + 1))
fi

echo "Passed:$OK Failed:$NG"




