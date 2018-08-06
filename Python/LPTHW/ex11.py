#!/usr/bin/python
# -*- coding: utf-8 -*-


#   decode是转成unicode码，encode是转为需要的编码方式 https://www.zhihu.com/question/36735487
answer = raw_input("请输入你是谁  ".decode('utf-8').encode('gbk'))
print u"竟然你是%s，那你好" % (answer.decode('gbk'))

print "How old are you?",
age = int(raw_input('请输入年龄：'.decode('utf-8').encode('GBK')))

print "How tall are you?"
height = raw_input("input:")
print "How much do you weigh?", 
weight = raw_input()

print "So, you're %r old, %r tall and %r heavy." % (age, height, weight)
print u"所以，你是 %s old, %s tall and %s heavy." % (age, height, weight)