#!/bin/bash

# options
i=1
while [[ "$i" -le "$#" ]]; do
	if [[ ${!i} == "-h" ]];then ((i++)); host=${!i}; 
	fi
	if [[ ${!i} == "-u" ]];then ((i++)); user=${!i}; 
	fi
	if [[ ${!i} == "-p" ]];then ((i++)); pass=${!i}; 
	fi
	# -------------------------------------------------------
	((i++))
done
# arguments
cmd=$1
if [[ ! "$host" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
	host=$IP_HOST_PC
fi
if [[ ! "$host" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
	echo "No host specified. use default: 172.16.1.45"
	host=172.16.1.45
fi
[[ -z "$user" ]] && user=$FTP_USER
[[ -z "$pass" ]] && pass=$FTP_PW
[[ -z "$user" ]] && { echo "ERROR: unknow username" ; exit 1; }
[[ -z "$pass" ]] && { echo "ERROR: unknow password" ; exit 2; }


ftp -n -v $host <<INPUT
ascii
user $user $pass
prompt
$cmd
quit
INPUT