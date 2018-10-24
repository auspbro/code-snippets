#!/bin/bash
# --------------------- 
# 作者：_acme_ 
# 来源：CSDN 
# 原文：https://blog.csdn.net/qq_18297675/article/details/52693464 

str="a b c d e f g h i j k"

echo "the source string is: "${str}                         #源字符串
echo "the string length is: "${#str}                        #字符串长度
echo "the 6th to last string is "${str:5}                  #截取从第五个后面开始到最后的字符
echo "the 6th to 8th string is "${str:5:2}                 #截取从第五个后面开始的2个字符
echo "after delete shortest string of start is "${str#a*f} #从开头删除a到f的字符
echo "after delete widest string of start is "${str##a*}   #从开头删除a以后的字符
echo "after delete shortest string of end is "${str%f*j}   #从结尾删除f到j的字符
echo "after delete widest string of end is "${str%%*j}     #从结尾删除j前面的所有字符包括j
