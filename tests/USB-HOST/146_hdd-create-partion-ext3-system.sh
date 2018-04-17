#!/bin/sh
# usb device driver autotest shell-script

set -e
#set -x

#Creating partition and making file system for card 
echo "\n*********CREATING PARTITION AND MAKING FILE SYSTEM FOR USB*************\n"

echo "This device will be used: /dev/$DEVICE_USB2C1"
echo "Creating  partion 1 and partion 2 for card"
#( echo d; echo 1; echo d; echo 2; echo d; echo 3; echo d; echo n; echo p; echo 1; echo 2048; echo "+1500M"; echo t; echo 83; echo w) | fdisk $DEVICE_USB2C1 > /dev/null 2>&1
fdisk /dev/$DEVICE_USB2C1 << END
d
d
d
d
n
p
1
2048
+1500M
t
83
w
END

sleep 5
echo "Make ext3 file system for partion 1"
mkfs.ext3 /dev/${DEVICE_USB2C1}1 > /dev/null 2>&1
sleep 5

#(echo n; echo p; echo 2; echo 3074048; echo "+500M"; echo t; echo 2; echo 83; echo w) | fdisk ${DEVICE_USB2C1} > /dev/null 2>&1
fdisk /dev/${DEVICE_USB2C1} << END
n
p
2
3074048
+500M
t
2
83
w
END

sleep 5
echo "Make ext3 file system for partion 2"
mkfs.ext3 /dev/${DEVICE_USB2C1}2 > /dev/null 2>&1
sleep 5

#(echo n; echo p; echo 3; echo 4098048; echo "+500M"; echo t; echo 3; echo 83; echo w) | fdisk ${DEVICE_USB2C1} > /dev/null 2>&1
fdisk /dev/${DEVICE_USB2C1} << END
n
p
3
4098048
+500M
t
3
83
w
END

sleep 5
echo "Make ext3 file system for partion 3"
mkfs.ext3 /dev/${DEVICE_USB2C1}3 > /dev/null 2>&1
sleep 5

for ((  i = 1 ;  i <= 3;  i++  ))
do
	if [ -e "/dev/$DEVICE_USB2C1$i" ]; then
		if [ "$i" = "3" ] ; then
			echo "CREATE PARTITION SUCCESS"
		fi	
	else
		echo "CREATE PARTITION FAILED"
		eval $FAIL_MEG
		break
	fi		

done

eval $PASS_MEG

echo "\n***********************************************************************\n"
