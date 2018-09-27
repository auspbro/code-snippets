#!/usr/bin/env python
# coding: utf-8

'''
请编写一个bmpinfo.py，可以检查任意文件是否是位图文件，如果是，打印出图片大小和颜色数。
'''

import os
import struct


def bmpinfo():
    bmp_path = raw_input("Please input the path of BMP file:")
    if os.path.splitext(bmp_path)[1] == '.bmp':
        with open(bmp_path, 'rb') as f:
            s = f.read(30)
        bmpinfo = struct.unpack('<ccIIIIIIHH', s)
        print "Here is the bmp info:"
        print "Size: %s * %s", (bmpinfo[6], bmpinfo[7])
        print "Number of colors: %s" % bmpinfo[9]
    else:
        print "You have input a wrong path."


if __name__ == '__main__':
    bmpinfo()
