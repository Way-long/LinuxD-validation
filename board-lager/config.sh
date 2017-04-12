#!/bin/sh


# -------------------------------------------------------------------------------
export IP_HOST_PC="192.168.1.45"
export IP_BOARD="192.168.1.120"
# export IP_BOARD="172.16.1.121"
# --------------------------------------------------------------------------------
export SUDO_PW="changetheworld"
export SSH_ROOT_PATH="/tftpboot/evaluation"
#used for ftp access
export FTP_USER="harunaga"
export FTP_PW="$SUDO_PW"
# --------------------------------------------------------------------------------
export SSH_AUTHEN="root@$IP_BOARD"



# ------------------------------------------------------------
export ENV_BOARD="linaro"
export ENV_PC="ubuntu"
#used when suspend the system
export WAKEUP_PORT="ttySC"
export WAKEUP_BY="/dev/ttyUSB0"


