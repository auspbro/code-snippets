#!/usr/bin/python
# -*- coding: utf-8 -*-

def my_abs(x):
    if not isinstance(x, (int, float)):
        raise TypeError('bad operand type')
    if x >= 0:
        return x
    else:
        return -x

x = int(raw_input('请输入数字：'.decode('utf-8').encode('gbk')))
xx = my_abs(x)

print u"%d的绝对值为：%d" % (x, xx)
        
