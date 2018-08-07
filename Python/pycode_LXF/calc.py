#!/usr/bin/python
# -*- coding: utf-8 -*-

def calc(*parameter_list):
    sum = 0
    for n in parameter_list:
        sum = sum + n * n
    return sum


print u"calc() 函数用来计算 a*a + b*b + c*c + ……"
print u"请输入参数1:",
p1 = int(raw_input())
print u"请输入参数2:",
p2 = int(raw_input())
print u"请输入参数3:",
p3 = int(raw_input())
print u"%d*%d+%d*%d+%d*%d平方和结果是：%d" % (p1, p1, p2, p2, p3, p3, calc(1, 2, 3))
# print u"平方和结果是：%d" % calc([1, 3, 5, 7])
