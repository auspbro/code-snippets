#! /bin/bash

###################################################
# Check AMD Diagnostics pass/fail log script.
# Copyright (c) 2016 Free Software Foundation, Inc.
##################################################
# Name: AMD_Diag_Go.sh
# Description: Check AMD Diagnostics pass/fail log script.
# History:
# 2016/12/13	Capt.	First release.
##################################################
PATH = /usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin
export PATH
##################################################
# Variables
#
user = $LOGNAME
password = "password"
scriptdir = "/home/diag/Desktop/"
logdir = "/home/diag/Desktop/Baffin_B-PROD_16-07-03_LINUX-64/"
tmpmountpoint = "/mnt/temp_mount"
dstdir = "/blah/backups/mysql_backups/"
##################################################
# Usage Options

echo "Now, I will run AMD Diagnostics..."
echo -e "The Diagnostics test log will be generated on $logdir"
cd $logdir
sudo bash ./Diag
sleep 5

grep -q "Total Fail:	0"  $logdir/log.txt
if [ "$?" -eq "0" ]; then
	sudo bash $scriptdir/switch2win.sh
else
	echo "Please call 911..."
fi

exit 0





