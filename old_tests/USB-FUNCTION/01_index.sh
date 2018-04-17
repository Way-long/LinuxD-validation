#!/bin/sh

set -a
#set -x

. ./config_usbfs.sh

echo "================================================================================="
echo "|                          TEST USB_FUNCTION DRIVER                             |"
echo "================================================================================="

echo "1)********************** usb function dmesg feature test ************************"
$(dirname $0)/001_dmesg.sh
sleep 3

echo "2)**************************** usb function interrupts **************************"
$(dirname $0)/002_proc-interrupts.sh
sleep 3

echo "3)************************** usb serial setting *********************************"
$(dirname $0)/003_usbfs_serial_setting.sh
sleep 3

echo "4)**************************** usb serial board to pc ***************************"
$(dirname $0)/004_usbfs_serial_board_to_pc.sh
sleep 3

echo "5)**************************** usb serial pc to board ***************************"
$(dirname $0)/005_usbfs_serial_pc_to_board.sh
sleep 3

echo "7)**************************** usb serial suspend test **************************"
$(dirname $0)/007_usbfs_serial_suspend_test.sh
sleep 3

echo "8)*********************** usb ethernet setting on board *************************"
$(dirname $0)/008_usbfs_ethernet_setting_board.sh
sleep 3

echo "9)*********************** usb ethernet setting on pc ****************************"
$(dirname $0)/009_usbfs_ethernet_setting_pc.sh
sleep 3

echo "10)*********************** usb ethernet ping board to pc ************************"
$(dirname $0)/010_usbfs_ethernet_ping_board_pc.sh
sleep 3

echo "11)*********************** usb ethernet ping pc to board ************************"
$(dirname $0)/011_usbfs_ethernet_ping_pc_board.sh
sleep 3

echo "12)********************** usb ethernet test after suspend ************************"
$(dirname $0)/012_usbfs_ethernet_suspend.sh
sleep 3

echo "14)********************** usb store gadget setting test *************************"
$(dirname $0)/014_usbfs_store_setting.sh
sleep 3

echo "15)********* usb store gadget copy 10M file from pc to storage ******************"
$(dirname $0)/015_usbfs_store_copy_from_pc_to_sto_10M.sh
sleep 3

echo "16)********* usb store gadget copy 100M file from pc to storage *****************"
$(dirname $0)/016_usbfs_store_copy_from_pc_to_sto_100M.sh
sleep 3

echo "17)********* usb store gadget copy 300M file from pc to storage *****************"
$(dirname $0)/017_usbfs_store_copy_from_pc_to_sto_300M.sh
sleep 3

echo "18)********* usb store gadget copy 10M file from storage to pc ******************"
$(dirname $0)/018_usbfs_store_copy_from_sto_to_pc_10M.sh
sleep 3

echo "19)********* usb store gadget copy 100M file from storage to pc *****************"
$(dirname $0)/019_usbfs_store_copy_from_sto_to_pc_100M.sh
sleep 3

echo "20)********* usb store gadget copy 300M file from storage to pc *****************"
$(dirname $0)/020_usbfs_store_copy_from_sto_to_pc_300M.sh
sleep 3

echo "21)****************** usb store gadget copy file speed **************************"
$(dirname $0)/021_usbfs_store_speed_copy_sto_pc.sh
sleep 3

echo "22)****************** usb store gadget left space copy **************************"
$(dirname $0)/022_usbfs_store_copy_left_space.sh
sleep 3

echo "24)****************** usb store gadget suspend test *****************************"
$(dirname $0)/024_usbfs_store_suspend.sh
sleep 3

echo "25)********* usb store SDcard copy 100M file from pc to sd **********************"
$(dirname $0)/025_usbfs_sd_store_copy_from_pc_to_sd_100M.sh
sleep 3

echo "26)********* usb store SDcard copy 500M file from pc to sd **********************"
$(dirname $0)/026_usbfs_sd_store_copy_from_pc_to_sd_500M.sh
sleep 3

echo "27)********* usb store SDcard copy 1G file from pc to sd ************************"
$(dirname $0)/027_usbfs_sd_store_copy_from_pc_to_sd_1G.sh
sleep 3

echo "28)********* usb store SDcard copy 100M file from sd to pc **********************"
$(dirname $0)/028_usbfs_sd_store_copy_from_sd_to_pc_100M.sh
sleep 3

echo "29)********* usb store SDcard copy 500M file from sd to pc **********************"
$(dirname $0)/029_usbfs_sd_store_copy_from_sd_to_pc_500M.sh
sleep 3

echo "30)********* usb store SDcard copy 1G file from pc sd pc ************************"
$(dirname $0)/030_usbfs_sd_store_copy_from_sd_to_pc_1G.sh
sleep 3

echo "31)****************** usb store sd copy file speed ******************************"
$(dirname $0)/031_usbfs_sd_store_speed_copy_sd_pc.sh
sleep 3

echo "37)****************** usb g_zero control write test *****************************"
$(dirname $0)/037_usbfs_gzero_write_control.sh
sleep 3

echo "38)****************** usb g_zero control read test ******************************"
$(dirname $0)/038_usbfs_gzero_read_control.sh
sleep 3

echo "39)****************** usb g_zero bulk write test ********************************"
$(dirname $0)/039_usbfs_gzero_write_bulk.sh
sleep 3

echo "40)****************** usb g_zero bulk read test *********************************"
$(dirname $0)/040_usbfs_gzero_read_bulk.sh
sleep 3

echo "47)********************* smp multiple cpu test **********************************"
$(dirname $0)/047_smp_multiple_cpu_test.sh
sleep 3

echo "48)*************************** stress cpu test **********************************"
$(dirname $0)/048_stress_cpu.sh
sleep 3


