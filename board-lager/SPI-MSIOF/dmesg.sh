#!/bin/sh

set -e
#set -x

echo "RCAR THERMAL dmesg feature test"

exec $(dirname $0)/../common/dmesg.sh "as_spi e6b10000.spi: probed"
