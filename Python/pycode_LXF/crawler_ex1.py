#!/usr/bin/python
# coding: utf-8


# 使用带参数的GET方法取回URL
import urllib
params = urllib.urlencode({'spam': 1, 'eggs': 2, 'bacon': 0})
f = urllib.urlopen("http://www.musi-cal.com/cgi-bin/query?%s" % params)
print f.read()

# # 使用POST方法
# import urllib
# params = urllib.urlencode({'spam': 1, 'eggs': 2, 'bacon': 0})
# f = urllib.urlopen("http://www.musi-cal.com/cgi-bin/query", params)
# print f.read()

# # 使用HTTP代理,自动跟踪重定向
# import urllib
# proxies = {'http': 'http://proxy.example.com:8080/'}
# opener = urllib.FancyURLopener(proxies)
# f = opener.open("http://www.python.org")
# f.read()

# # 不使用代理
# import urllib
# opener = urllib.FancyURLopener({})
# f = opener.open("http://www.python.org/")
# f.read()
