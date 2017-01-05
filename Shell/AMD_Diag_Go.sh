#! /bin/bash

###################################################
# Check AMD Diagnostics pass/fail log script.
# Copyright (c) 2016 Free Software Foundation, Inc.
##################################################
# Name: AMD_Diag_Go.sh
# Description: Check AMD Diagnostics pass/fail log script.
# History:
# 2016/12/13	Capt.	First release.
# 2016/01/05	Capt.	Add Physics RAM size check feature.
##################################################
PATH = /usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin
export PATH
##################################################
# Variables
#
user=$LOGNAME
password="password"
scriptdir="/home/diag/Desktop/"
logdir="/home/diag/Desktop/Baffin_BD-PROD_16-07-03_LINUX-64/"
tmpmountpoint="/mnt/temp_mount"
dstdir="/blah/backups/mysql_backups/"
##################################################
# Usage Options
#
# usage () {
#   echo "Usage: $0 [OPTION]"
#   echo "-d, --dest=name       Destination directory. Default is /tmp"
#   echo "-h, --help            Display this help and exit."
#   echo "-p, --password[=name] Password to use when connecting to server. If password is"
#   echo "                      not given it's asked from the tty."
#   echo "-t                    Temporary mount point for the snapshot. Default is /mnt."
#   echo "-u, --user=name       User for login if not current user"
#   exit 1
# }

##################################################
# Physics Memory Size Check
# If RAM size > 4GB switch to Windows
#
sudo dmidecode --type memory > $logdir/ramsize.log
grep -q "Maximum Capacity: 4 GB" $logdir/ramsize.log
if [ "$?" -eq "0" ]; then
	sudo bash $logdir/switch2win.sh
fi

##################################################
# Start AMD Diagnostics Test
# And check the log file pass or fail.
#
echo "Now, I will run AMD Diagnostics..."
echo -e "The Diagnostics test log will be generated on $logdir"
cd $logdir
sudo bash ./Diag
sleep 5

grep -q "Total Fail:	0"  $logdir/log.txt
if [ "$?" -eq "0" ]; then
	sudo bash $logdir/switch2win.sh
else
	echo "AMD Diagnostics Test Failed, Please call 911...@@"
fi

exit 0





