ifconfig eth0 | grep "inet add" | grep -o -E "1[0-9]+.[0-9]+.[0-9]+.[0-9]+" | head -1
