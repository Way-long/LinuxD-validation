#!/bin/sh
# mount devices

set -e
#set -x

if [ $# -ne 1 ]; then
    echo "usage: $(basename $0) PATTERN" >& 2
fi

DEV_DIR="$1"

echo "Mount devices $DEV_DIR"

case "$DEV_DIR" in

# CN13 SD0
"/mnt/sd0")
$(dirname $0)/mount-quiet.sh $DEV_DIR ee100000.sd mmcblk*
;;

# CN14 SD3
"/mnt/sd1")
$(dirname $0)/mount-quiet.sh $DEV_DIR ee160000.sd mmcblk*
;;

# CN8 SATA
"/mnt/hd0")
$(dirname $0)/mount-quiet.sh $DEV_DIR ee300000.sata sd*
;;

# CN8 SATA
"/mnt/hd1")
$(dirname $0)/mount-quiet.sh $DEV_DIR ee300000.sata sd* 1
;;

# CN10 LOW:USB2_1
"/mnt/usb2")
$(dirname $0)/mount-quiet.sh $DEV_DIR ee0a0100.usb sd*
;;

# CN10 UP:USB2_2
"/mnt/usb2c2")
$(dirname $0)/mount-quiet.sh $DEV_DIR ee0c0100.usb sd*
;;

# CN11 USB3 (board salvator not supported)
#"/mnt/usb3")
#$(dirname $0)/mount-quiet.sh $DEV_DIR ee0c0100.usb sd*
#;;

# RAM
"/tmp/temp")
mount -t tmpfs -o size=450M tmpfs $DEV_DIR
;;

esac

