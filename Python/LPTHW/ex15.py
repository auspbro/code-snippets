#!/usr/bin/env python
# -*- coding: utf-8 -*-

# 从sys模组或代码库中导入argv feature
from sys import argv

# 定义参数个数
script, filename = argv

txt = open(filename)

# 以原始数据方式输出文件名
print "Here's your file %r:" % filename
# 以使用者视角方式输出文件名
print "Here's your file %s:" % filename
print txt.read()

print "Type the filename again:"
file_again = raw_input("> ")

txt_again = open(file_again)

print txt_again.read()
