#!/usr/bin/python 
# coding: utf-8

def log(func):
    def wrapper(*args, **kw):
        print 'call %s():' % func.__name__
        return func(*args, **kw)
    return wrapper

@log
def now():
    print '2018-08-10'

print now()
