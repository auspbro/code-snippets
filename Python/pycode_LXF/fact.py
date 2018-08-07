#!/usr/bin/python
# coding: utf-8

def fact(n):
    if n == 1:
        return 1
    return n * fact(n - 1)

print u"递归函数fact()用于计算阶乘n! = 1 x 2 x 3 x ... x n"
print u"请输入一个数："
i = int(raw_input())
print u"%d的阶乘值是：%d" % (i, fact(i))

