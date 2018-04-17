#!/bin/sh
# mount devices

set -a
#set -x

if [ $# -ne 1 ]; then
    echo "usage: $(basename $0) PATTERN" >& 2
fi

DEV_DIR="$1"

echo "Mount devices $DEV_DIR"

case "$DEV_DIR" in

# CN13 SD0
"/mnt/sd0")
echo "Check device: $DEV_DIR $SDHI_INTERRUPT_0 mmcblk*"
$(dirname $0)/mount-quiet.sh $DEV_DIR $SDHI_INTERRUPT_0 mmcblk*
;;

# CN14 SD3
"/mnt/sd1")
echo "Check device: $DEV_DIR $SDHI_INTERRUPT_1 mmcblk*"
$(dirname $0)/mount-quiet.sh $DEV_DIR $SDHI_INTERRUPT_1 mmcblk*
;;

# CN8 SATA
"/mnt/hd0")
echo "Check device: $DEV_DIR $SATA_INTERRUPT sd*"
$(dirname $0)/mount-quiet.sh $DEV_DIR $SATA_INTERRUPT sd*
;;

# CN8 SATA
"/mnt/hd1")
echo "Check device: $DEV_DIR $SATA_INTERRUPT sd*"
$(dirname $0)/mount-quiet.sh $DEV_DIR $SATA_INTERRUPT sd* 1
;;

# CN10 LOW:USB2_1
"/mnt/usb2")
echo "Check device: $DEV_DIR $USB2_CH1_INTERRUPT sd*"
$(dirname $0)/mount-quiet.sh $DEV_DIR $USB2_CH1_INTERRUPT sd*
;;

# CN10 UP:USB2_2
"/mnt/usb2c2")
echo "Check device: $DEV_DIR $USB2_CH2_INTERRUPT sd*"
$(dirname $0)/mount-quiet.sh $DEV_DIR $USB2_CH2_INTERRUPT sd*
;;

# CN11 USB3 (board salvator not supported)
"/mnt/usb3")
echo "Check device: $DEV_DIR $USB3_INTERRUPT sd*"
$(dirname $0)/mount-quiet.sh $DEV_DIR $USB3_INTERRUPT sd*
;;

# RAM
"/tmp/temp")
echo "Check device: $DEV_DIR tmpfs"
mount -t tmpfs -o size=450M tmpfs $DEV_DIR
;;

esac

