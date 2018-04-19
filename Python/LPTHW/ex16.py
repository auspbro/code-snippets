#!/usr/bin/python
# -*- coding: utf-8 -*-
# 从 sys 模组或库中导入 argv 功能
from sys import argv
# 定义参数个数
script, filename = argv

# 打印提示信息
print "We are going to erase %r." % filename
print "If you don't want that, please hint <CTRL-C>(^C)."
print "If you do want that, hint <Enter> key."
# 提示输入信息
raw_input("?")

print "Opening the file..."
# 引用 open 函数
target = open(filename, 'w')

print "Truncating the file, goodbye!"
# 调用 open 函数的 truncate 方法
target.truncate()

print "Now, I'm going to ask you three lines."

line1 = raw_input("line 1:")
line2 = raw_input("line 2:")
line3 = raw_input("line 3: ")

print "Now, I'm going to write these to file."
target.write(line1)
target.write("\n")
target.write(line2)
target.write("\n")
target.write(line3)
target.write("\n")

print "And finally, we close it."
target.close()


