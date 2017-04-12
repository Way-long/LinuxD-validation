#!/bin/sh
# unbind-bind-write.sh
#
# Simple test of binding and unbinding a device
# 
# Copyright (C) 2013 Horms Soltutions Ltd.
#
# Contact: Simon Horman <horms@verge.net.au>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License.

set -e
#set -x

if [ $# -ne 0 ]; then
	echo "usage: $(basename $0)" >& 2
	exit 1
fi

GPIO_KEY_DIR="/sys/bus/platform/drivers/gpio-keys"
GPIO_KEY_DRIVER="/sys/bus/platform/drivers/gpio-keys/keyboard"
GPIO_KEY_NAME="keyboard"
GPIO_RCAR_DIR="/sys/bus/platform/drivers/gpio_rcar"
GPIO_RCAR_DRIVER="/sys/bus/platform/drivers/gpio_rcar/e6055000.gpio"
GPIO_RCAR_NAME="e6055000.gpio"

CHECK_PATH="$GPIO_KEY_DRIVER $GPIO_RCAR_DRIVER"

exists ()
{
	for i in $CHECK_PATH; do
		if [ ! -e "$i" ]; then
        		echo \'$i\': No such file or directory >&2
        		exit 1
		fi
	done
}

echo "Test device files exists"
exists

echo "Unbind GPIO KEY"
echo "$GPIO_KEY_NAME" > "$GPIO_KEY_DIR/unbind"

echo "Test that block device and sysfs directory no longer exist"
for i in $GPIO_KEY_DRIVER; do
	sleep 1
	if [ -e "$i" ]; then
		echo Failed to unbind \'$GPIO_KEY_NAME\': \'$i\' still exists >&2
		exit 1
	fi
done

echo "Unbind GPIO RCAR"
echo "$GPIO_RCAR_NAME" > "$GPIO_RCAR_DIR/unbind"
echo "Test that block device and sysfs directory no longer exist"
for i in $GPIO_RCAR_DRIVER; do
	sleep 1
	if [ -e "$i" ]; then
		echo Failed to unbind \'$GPIO_RCAR_NAME\': \'$i\' still exists >&2
		exit 1
	fi
done

echo "Bind GPIO RCAR"
echo "$GPIO_RCAR_NAME" > "$GPIO_RCAR_DIR/bind"

echo "Wait for device files to be recreated"
for i in $(seq 1 32); do
	OK="true"
	for i in $GPIO_RCAR_DRIVER; do
		if [ ! -e "$i" ]; then
			OK="false"
			break
		fi
	done
	if [ "$OK" = "false" ]; then
		sleep 1
	else 
		break
	fi
done

echo "Bind GPIO KEY"
echo "$GPIO_KEY_NAME" > "$GPIO_KEY_DIR/bind"
echo "Wait for device files to be recreated"
for i in $(seq 1 32); do
	OK="true"
	for i in $GPIO_KEY_DRIVER; do
		if [ ! -e "$i" ]; then
			OK="false"
			break
		fi
	done
	if [ "$OK" = "false" ]; then
		sleep 1
	else 
		break
	fi
done


echo "Test that device files once again exist"
exists
