#!/usr/bin/python
# -*- coding: utf-8 -*-

# power() 函数用来求 x 的 n 次幂（次方）
def power(x, n):
    s = 1
    while n > 0:
        n = n - 1
        s = s * x
    return s

print u"power() 函数用来求 x 的 n 次幂（次方）"
print u"请输入底数 x:",
radix = int(raw_input())
print u"请输入指数 n:",
index = int(raw_input())
print u"%d的%d次方结果是：%d" % (radix, index, power(radix, index))
