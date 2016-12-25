#!/bin/bash
#rpm-check.sh

#This script released to description, list & confirm if could be install 
# a rpm package
#Output to a log.

SUCCESS=0
E_NOARGS=65

if [ -z "$1"]; then
	echo "Usage: `$basename $0` rpm-file"
	exit E_NOARGS
fi

{
	echo 
	echo "Archive description:"
	rpm -qpi $1		#查询说明
	echo
	echo "Archive lsitings"
	rpm -qpl $1		#查询列表
	echo
	rpm -i --test $1	#查询rpm包是否可以安装

	if [[ "$?" -eq $SUCCESS ]]; then
		echo "$1 can be install"
	else
		echo "$1 can not be install"
	fi
	echo 
} > "$1.test"

echo "Results of rpm test in file $1.test"
exit 0	