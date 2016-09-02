#!/bin/bash

set -e
#set -x

echo "USB FUNCTION STORE GATAGET SETTING"

#modprobe device
$CMD_SSH <<ENDSSH

mount -t tmpfs -o size=400m tmpfs /tmp

dd if=/dev/zero of=/tmp/tmp.img bs=1M count=350

yes | mkfs.ext3 -L storage /tmp/tmp.img

modprobe g_mass_storage file=/tmp/tmp.img

ENDSSH

sleep 5

#rmmod device
$CMD_SSH <<ENDSSH

rmmod g_mass_storage

umount /tmp

ENDSSH