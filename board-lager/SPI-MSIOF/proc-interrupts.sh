#!/bin/sh

set -e
#set -x

echo "rcar_thermal /proc/interrupts presence test"

IRQ=115
DIV_NAME="e6e10000.spi"
if $(dirname $0)/../common/proc-interrupts.sh "$DIV_NAME" | grep "$IRQ"; then
	echo "Test passed"
else
	echo "Test has not passed"
fi
