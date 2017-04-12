#!/bin/sh

echo "root@linaro-nano:~#./read_mtd.sh -d 20"
$(dirname $0)/read_mtd.sh -d 20
sleep 3
echo "root@linaro-nano:~#./read_mtd.sh 20"
$(dirname $0)/read_mtd.sh 20
sleep 3
echo "root@linaro-nano:~#./write_mtd.sh -d 20"
$(dirname $0)/write_mtd.sh -d 20
sleep 3
echo "root@linaro-nano:~#./write_mtd.sh 20"
$(dirname $0)/write_mtd.sh 20
sleep 3