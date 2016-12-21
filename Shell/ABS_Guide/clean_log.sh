#! /bin/bash

###################################################
# Clear /var/log log files.
# Copyright (c) 2016 Free Software Foundation, Inc.
##################################################
# Name: clean_log.sh
# Description: Clear /var/log log files.
# History:
# 2016/12/20	Capt.	First release.
##################################################
PATH = /usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin
export PATH
##################################################
# Variables
#
user=$LOGNAME
password="password"
scriptdir="/home/diag/Desktop/"
LOG_DIR=/var/log
ROOT_UID=0		# $UID为0的时候，用户才具有根权限
LINES=50		# 默认保存行数
E_XCD=66		# 不能修改目录？
E_NOTROOT=67	# 非根用户将以error退出

tmpmountpoint="/mnt/temp_mount"
dstdir="/blah/backups/mysql_backups/"
##################################################
# Usage Options


###### START SCRIPT ########
if [ "$UID" -ne "$ROOT_UID" ]; then	
	echo "Must be root to run this script."
	exit $E_NOTROOT
fi

if [ -n "$1" ]; then
	lines=$1
else
	lines=$LINES 	# 		
fi

cd $LOG_DIR
if [ `pwd` != "$LOG_DIR" ]; then
	echo "Can't change to $LOG_DIR."
	exit $E_XCD
fi

cat /dev/null > message
cat /dev/null > wtmp
echo "Logs cleaned up..."
exit 0
