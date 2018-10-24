#!/bin/bash

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

