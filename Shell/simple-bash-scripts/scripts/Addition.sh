#!/bin/bash

# 使用read [-t] 参数计时输入
if read -t 10 -p "Enter the First Number in 10 Seconds:" a
then
	echo "hello, welcome to my script."
else
	echo "Sorry, too slow."
fi


if read -t 10 -p "Enter the Second Number in 10 Seconds:" b
then
	echo "Good job!"
else
	echo "Sorry, too slow."
fi

x=$(expr "$a" + "$b")
echo $a + $b = $x

