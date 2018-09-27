#!/usr/bin/env python
# coding: utf-8

'''
找一个网页，例如https://www.python.org/events/python-events/，用浏览器查看源码并复制，
然后尝试解析一下HTML，输出Python官网发布的会议时间、名称和地点。
'''


from HTMLParser import HTMLParser
import urllib


class PyEventParser(HTMLParser):
    def __init__(self):
        HTMLParser.__init__(self)
        self._count = 0
        self._events = dict()
        self._flag = None

    def handle_starttag(self, tag, attrs):
        if tag == 'h3' and attrs.__contains__(('class', 'event-title')):
            self._count += 1
            self._events[self._count] = dict()
            self._flag = 'event-title'
        if tag == 'time':
            self._flag = 'time'
        if tag == 'span' and attrs.__contains__(('class', 'event-location')):
            self._flag = 'event-location'

    def handle_data(self, data):
        if self._flag == 'event-title':
            self._events[self._count][self._flag] = data
        if self._flag == 'time':
            self._events[self._count][self._flag] = data
        if self._flag == 'event-location':
            self._events[self._count][self._flag] = data
        self._flag = None

    def event_list(self):
        print '近期关于Python的会议有：', self._count, '个，具体如下：'
        for event in self._events.values():
            print event['event-title'], '\t', event['time'], '\t', event['event-location']


try:
    parser = PyEventParser()
    pypage = urllib.urlopen('https://www.python.org/events/python-events/')
    pyhtml = pypage.read()
except IOError as e:
    print 'IOError:', e
else:
    parser.feed(pyhtml)
    parser.event_list()
finally:
    pypage.close()
        


        
