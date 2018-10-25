#!/bin/bash

# 2.until语句
# until语句是只要条件为假就执行下列语句 


i=$1

until [ $i -le 0 ]
do
echo $i
((i--))
done