#!/bin/bash

# 三.shell测试判断test或[]
# 需要注意的是使用[]的时候必须要每个变量之间都要有空格，和左右中括号也要有空格，否则报错。

echo "Please input a filename: "
read filename
echo "by test\n"

test -f $filename && echo "the file is ordinary file" || echo "the file is not ordinary file"
test -d $filename && echo "the file is document folder" || echo "the file is not document folder"
test -r $filename && echo "the file can read" || echo "the file can not read"
test -w $filename && echo "the file can write" || echo "the file can not write"
test -x $filename && echo "the file can executable" || echo "the file can not executable"

echo "by []\n"
[ -f $filename ] && echo "the file is ordinary file" || echo "the file is not ordinary file"
[ -d $filename ] && echo "the file is document folder" || echo "the file is not document folder"
[ -r $filename ] && echo "the file can read" || echo "the file can not read"
[ -w $filename ] && echo "the file can write" || echo "the file can not write"
[ -x $filename ] && echo "the file can executable" || echo "the file can not executable"

echo "Please input 2 numbers: "
read num1
read num2

echo "num1 = "${num1}
echo "num2 = "${num2}
echo "by test\n"
test $num1 -eq $num2 && echo "num1 == num2" || echo "num1 != num2"
test $num1 -ne $num2 && echo "num1 != num2" || echo "num1 == num2"
test $num1 -gt $num2 && echo "num1 > num2" || echo "num1 <= num2"
test $num1 -lt $num2 && echo "num1 < num2" || echo "num1 >= num2"
test $num1 -ge $num2 && echo "num1 >= num2" || echo "num1 > num2"
test $num1 -le $num2 && echo "num1 <= num2" || echo "num1 > num2"

echo "by []\n"
[ $num1 -eq $num2 ] && echo "num1 == num2" || echo "num1 != num2"
[ $num1 -ne $num2 ] && echo "num1 != num2" || echo "num1 == num2"
[ $num1 -gt $num2 ] && echo "num1 > num2" || echo "num1 <= num2"
[ $num1 -lt $num2 ] && echo "num1 < num2" || echo "num1 >= num2"
[ $num1 -ge $num2 ] && echo "num1 >= num2" || echo "num1 > num2"
[ $num1 -le $num2 ] && echo "num1 <= num2" || echo "num1 > num2"


