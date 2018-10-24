#!/bin/bash

# 一.shell变量
# shell变量和一些编程语言不同，一般shell的变量赋值的时候不用带“$”，而使用或者输出的时候要带“$”。加减乘除的时候要加两层小括号。括号外面要有一个“$”，括号里面的变量可以不用“$”。需要注意的是，变量赋值，变量使用的时候不能有空格，否则会被解析成命令，报错无此命令。
# --------------------- 
# 作者：_acme_ 
# 来源：CSDN 
# 原文：https://blog.csdn.net/qq_18297675/article/details/52693464 


a=10
b=20
c="This is a test"
d=$((a+b))
e=$((a-b))
f=$((a*b))
g=$((a/b))
h=$((a%b))
i=$((a**3))

echo $c
echo "a = "$a
echo "b = "$b
echo "a+b = "$d
echo "a-b = "$e
echo "a*b = "${f}      #输出a*b的值
echo "a/b = "${g}      #输出a/b的值
echo "a%b = "${h}      #输出a%b的值
echo "a^3 = "${i}     #输出a的3次方的值
echo "\n==============================="
echo "a+b = "$((a+b))  #输出a+b的值
echo "a-b = "$((a-b))  #输出a-b的值
echo "a*b = "$((a*b))  #输出a*b的值
echo "a/b = "$((a/b))  #输出a/b的值
echo "a%b = "$((a%b))  #输出a%b的值
echo "a^3 = "$((a**3)) #输出a的3次方的值

echo $((a+b*a-b/a+a%b+a**2)) #表达式可以很长

