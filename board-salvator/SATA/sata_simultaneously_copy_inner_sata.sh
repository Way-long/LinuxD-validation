#!/bin/sh
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
mkdir -p $HDD_DIR1

# Mount HD0, HD1 on rootfs. 
echo "Mount the devices on rootfs..."
if ! $(dirname $0)/../common/mount-device.sh $HDD_DIR > /dev/null; then
    echo "Could not mount a HD0 card storage"
    rm -rf $HDD_DIR
    exit 1
fi
if ! $(dirname $0)/../common/mount-device.sh $HDD_DIR1 > /dev/null; then
    echo "Could not mount a HD1 card storage"
    rm -rf $HDD_DIR1
    exit 1
fi

# Make data on HD0 HD1
echo "Please wait while program make data on HD0 HD1..."
if ! $(dirname $0)/../common/read_write_data.py $SOURCE $HDD_DIR $SIZE $LOGFILE; then
    echo "Prepare the data on HD0 failed"
    exit 1
fi

if ! $(dirname $0)/../common/read_write_data.py $SOURCE $HDD_DIR1 $SIZE $LOGFILE; then
    echo "Prepare the data on HD1 failed"
    exit 1
fi

sync;

if [ -f $LOGFILE ]; then
    rm -r $LOGFILE
fi
sleep 1 

echo "Writing/Reading data between HD0 and HD1 simultaneously..."

if $(dirname $0)/../common/read_write_simultaneously.py $HDD_DIR$FILE_NAME \
$HDD_DIR1$FILE_NAME$SD_NAME0 $HDD_DIR1$FILE_NAME $HDD_DIR$FILE_NAME$SD_NAME1 $SIZE ; then
    echo "Write/read the data between HD0 and HD1 has finished"
else
    echo "Write/read the data between HD0 and HD1 has failed"
    exit 1
fi
# To ensure that the writing data has been finished.
if ! $(dirname $0)/../common/umount-device.sh $HDD_DIR > /dev/null; then
    echo "Could not umount the HD0 card"
    exit 1
fi
if ! $(dirname $0)/../common/umount-device.sh $HDD_DIR1 > /dev/null; then
    echo "Could not umount the HD1 card"
    exit 1
fi

# Re-mount
if ! $(dirname $0)/../common/mount-device.sh $HDD_DIR > /dev/null; then
    echo "Could not re-mount the HD0 card"
    exit 1
fi
if ! $(dirname $0)/../common/mount-device.sh $HDD_DIR1 > /dev/null; then
    echo "Could not re-mount the HD1 card"
    exit 1
fi

echo "Confirm the copied data"
if cmp $HDD_DIR1$FILE_NAME $HDD_DIR$FILE_NAME$SD_NAME1; then
    if cmp $HDD_DIR$FILE_NAME $HDD_DIR1$FILE_NAME$SD_NAME0; then
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
    exit 1
fi

if rm -r $HDD_DIR1/*; then
    if ! $(dirname $0)/../common/umount-device.sh $HDD_DIR1 > /dev/null; then
        echo "Could not umount the HD1 card"
        exit 1
    fi
    rm -r $HDD_DIR1/
else
    echo "Could not remove data out of HD1"
    exit 1
fi
