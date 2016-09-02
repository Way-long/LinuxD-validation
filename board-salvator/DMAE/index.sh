#!/bin/sh
# dma device driver autotest shell-script

set -a
#set -x

case "$1" in

1)
$(dirname $0)/exec_dma.sh 001_dma_check_dmesg.sh
sleep 3
;;

2)
$(dirname $0)/exec_dma.sh 002_dma_check_device.sh
;;

3)
$(dirname $0)/exec_dma.sh 003_dma_check_chan_dma0.sh
sleep 3
;;

4)
$(dirname $0)/exec_dma.sh 004_dma_check_chan_dma1.sh
sleep 3
;;

5)
$(dirname $0)/exec_dma.sh 005_dma_check_chan_dma2.sh
sleep 3
;;

6)
$(dirname $0)/exec_dma.sh 006_dma_check_chan_dma3.sh
sleep 3
;;

7)
$(dirname $0)/exec_dma.sh 007_dma_check_chan_dma4.sh
;;

8)
$(dirname $0)/exec_dma.sh 008_dma_check_chan_dma5.sh
;;

9)
$(dirname $0)/exec_dma.sh 009_dma_check_chan_dma6.sh
;;

10)
$(dirname $0)/exec_dma.sh 010_dma_check_interrupt_sys_dmac0.sh
;;

11)
$(dirname $0)/exec_dma.sh 011_dma_check_interrupt_sys_dmac1.sh
;;

12)
$(dirname $0)/exec_dma.sh 012_dma_check_interrupt_sys_dmac2.sh
;;

13)
$(dirname $0)/exec_dma.sh 013_dma_check_interrupt_audio_dmac0.sh
;;

14)
$(dirname $0)/exec_dma.sh 014_dma_check_interrupt_audio_dmac1.sh
;;

15)
$(dirname $0)/exec_dma.sh 015_dma_check_interrupt_usb_dmac0.sh
;;

16)
$(dirname $0)/exec_dma.sh 016_dma_check_interrupt_usb_dmac1.sh
;;

17)
$(dirname $0)/exec_dma.sh 017_dma_memcpy_sys_dmac0.sh
;;

18)
$(dirname $0)/exec_dma.sh 018_dma_memcpy_sys_dmac1.sh
;;

19)
$(dirname $0)/exec_dma.sh 019_dma_memcpy_sys_dmac2.sh
;;

20)
$(dirname $0)/exec_dma.sh 020_dma_memcpy_audio_dmac0.sh
;;

21)
$(dirname $0)/exec_dma.sh 021_dma_memcpy_audio_dmac1.sh
;;

22)
$(dirname $0)/exec_dma.sh 022_dma_memcpy_usb_dmac0.sh
;;

23)
$(dirname $0)/exec_dma.sh 023_dma_memcpy_usb_dmac1.sh
;;

24)
$(dirname $0)/exec_dma.sh 024_dma_unbind_bind_sys_dmac0.sh
;;

25)
$(dirname $0)/exec_dma.sh 025_dma_unbind_bind_sys_dmac1.sh
;;

26)
$(dirname $0)/exec_dma.sh 026_dma_unbind_bind_sys_dmac2.sh
;;

27)
$(dirname $0)/exec_dma.sh 027_dma_unbind_bind_audio_dmac0.sh
;;

28)
$(dirname $0)/exec_dma.sh 028_dma_unbind_bind_audio_dmac1.sh
;;

29)
$(dirname $0)/exec_dma.sh 029_dma_unbind_bind_usb_dmac0.sh
;;

30)
$(dirname $0)/exec_dma.sh 030_dma_unbind_bind_usb_dmac1.sh
;;

esac