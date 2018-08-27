#!/usr/bin/python
# coding: utf-8

'百度贴吧图片抓取'

__author__ = 'Xiang Xue'

import urllib
import re

# 获取 html 页面 source code
def get_html(url):
    pageAddr = urllib.urlopen(url)
    html_code = pageAddr.read()
    page_file = open('html_code.txt', 'w')
    page_file.write(html_code)
    page_file.close
    return html_code

# 抓取页面图片保存到本地
def get_image(html_code):
    reg = r'src="(.+?\.jpg)" width'
    reg_img = re.compile(reg)
    img_list = reg_img.findall(html_code)
    x = 0
    for img in img_list:
        # print img
        urllib.urlretrieve(img, '%s.jpg' %x)
        x =+ 1

print u'--------网页图片抓取----------'
print u'请输入url：'
url = raw_input()
if url:
    pass
else:
    print u'------没有地址输入正在使用默认地址-------'
    url = 'http://tieba.baidu.com/p/1753935195'

print u'-------正在获取网页--------'
html_code = get_html(url)
print u'-------正在下载图片--------'
get_image(html_code)
print u'-------下载成功--------'
raw_input('Press Enter to exit.')


