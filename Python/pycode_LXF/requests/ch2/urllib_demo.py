#!/usr/bin/env python
# -*- coding: utf-8 -*-

import urllib, urllib2

URL_IP = 'http://127.0.0.1:8000/ip'

def use_simple_urllib2():
    response = urllib2.urlopen(URL_IP)
    print '>>>Response Headers:'
    print response.info()
    print '>>>Response Body:'
    print ''.join([line for line in response.readlines()])


if __name__ == '__main__':
    print '>>>Use simple urllib2:'
    use_simple_urllib2()
