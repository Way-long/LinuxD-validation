#!/bin/bash
# sata device driver autotest shell-script

set -e
#set -x

if [ $# -lt 1 ]; then
    echo "usage : $(basename $0) FILE_SIZE"
    exit 1
fi

SIZE="$1"
FILE_NAME="/file-$SIZE$UNIT"

mkdir -p $HDD_DIR
mkdir -p $RAM_DIR

# Mount the storage of ram, hd0 to rootfs
echo "Mount the devices on rootfs..."
if ! $(dirname $0)/../common/mount-device.sh $RAM_DIR > /dev/null; then
    echo "Could not mount a tmpfs storage"
    rm -rf $RAM_DIR
    exit 1
fi
if ! $(dirname $0)/../common/mount-device.sh $HDD_DIR > /dev/null; then
    echo "Could not mount a HD card storage"
    rm -rf $HDD_DIR
    exit 1
fi

echo "Please wait while program make data on RAM and HD0..."
# Make a data file on ram:
if ! $(dirname $0)/../common/read_write_data.py $SOURCE $RAM_DIR $SIZE $LOGFILE; then
    echo "Prepare the data on RAM failed"
    exit 1
fi
# Make a data file on HD0
if ! $(dirname $0)/../common/read_write_data.py $SOURCE $HDD_DIR $SIZE $LOGFILE; then
    echo "Prepare the data on HD0 failed"
    exit 1
fi
sync;
if [ -f $LOGFILE ]; then
    rm -r $LOGFILE
fi
sleep 1

echo "Writing data between RAM and HD0 simultaneously..."

if $(dirname $0)/../common/read_write_simultaneously.py $RAM_DIR$FILE_NAME \
$HDD_DIR$FILE_NAME$RAM_NAME $HDD_DIR$FILE_NAME $RAM_DIR$FILE_NAME$SD_NAME0 $SIZE ; then
    echo "Write the data between RAM and HD0 has finished"
else
    echo "Write the data between RAM and HD0 has failed"
    exit 1
fi

# To ensure that the writing data has been finished.
if ! $(dirname $0)/../common/umount-device.sh $HDD_DIR > /dev/null; then
    echo "Could not umount the HD0 card"
    exit 1
fi
# Re-mount
if ! $(dirname $0)/../common/mount-device.sh $HDD_DIR > /dev/null; then
    echo "Could not re-mount the HD0 card"
    exit 1
fi

echo "Confirm the copied data"

if cmp $HDD_DIR$FILE_NAME $RAM_DIR$FILE_NAME$SD_NAME0; then
    if cmp $RAM_DIR$FILE_NAME $HDD_DIR$FILE_NAME$RAM_NAME; then
        eval $PASS_MEG
    else
        eval $FAIL_MEG
    fi
else
    eval $FAIL_MEG
fi

# Clean before finish work
if rm -r $HDD_DIR/*; then
    if ! $(dirname $0)/../common/umount-device.sh $HDD_DIR > /dev/null; then
        echo "Could not umount the HD0 card"
        exit 1
    fi
    rm -r $HDD_DIR/
else
    echo "Could not remove data out of HD0"
fi

if rm -r $RAM_DIR/*; then
    if ! $(dirname $0)/../common/umount-device.sh $RAM_DIR > /dev/null; then
        echo "Could not umount the RAM"
        exit 1
    fi
    rm -r $RAM_DIR/
else
    echo "Could not remove data out of RAM"
fi