#! /bin/bash

E_WRONG_ARGS=65
script_paramenters="-a -h -m -z"

if [[ $# -ne $Number_of_expected_args ]]; then
	echo "Usage: `basename $0` $script_paramenters"
	#`basename $0`是这个脚本的文件名
	exit $E_WRONG_ARGS
fi