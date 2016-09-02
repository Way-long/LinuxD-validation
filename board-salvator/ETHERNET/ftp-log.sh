#!/bin/sh

exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>ethernet_board_to_pc.log 2>&1

echo "root@linaro-nano:~# iperf -c 172.16.1.205 -u -b 10M"
iperf -c 172.16.1.205 -u -b 10M

echo "root@linaro-nano:~# iperf -c 172.16.1.205 -u -b 20M"
iperf -c 172.16.1.205 -u -b 20M

echo "root@linaro-nano:~# iperf -c 172.16.1.205 -u -b 30M"
iperf -c 172.16.1.205 -u -b 30M

echo "root@linaro-nano:~# iperf -c 172.16.1.205 -u -b 50M"
iperf -c 172.16.1.205 -u -b 50M

echo "root@linaro-nano:~# iperf -c 172.16.1.205 -u -b 100M"
iperf -c 172.16.1.205 -u -b 100M

echo "root@linaro-nano:~# iperf -c 172.16.1.205 -u -b 200M"
iperf -c 172.16.1.205 -u -b 200M

echo "root@linaro-nano:~# iperf -c 172.16.1.205 -u -b 300M"
iperf -c 172.16.1.205 -u -b 300M

echo "root@linaro-nano:~# iperf -c 172.16.1.205 -u -b 500M"
iperf -c 172.16.1.205 -u -b 500M

echo "root@linaro-nano:~# iperf -c 172.16.1.205 -u -b 1000M"
iperf -c 172.16.1.205 -u -b 1000M

echo "root@linaro-nano:~# iperf -c 172.16.1.205 -u -b 2000M"
iperf -c 172.16.1.205 -u -b 2000M

exit 0
