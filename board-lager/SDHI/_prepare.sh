

echo "preparing..."
# 

$(dirname $0)/../helper/partition_helper.sh /dev/mmcblk1
$(dirname $0)/../helper/partition_helper.sh /dev/mmcblk2

# 
echo "preparing finished..."