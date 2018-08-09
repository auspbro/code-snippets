#!/usr/bin/python
# coding: UTF-8

def trans(s):
    s = s.title()
    return s

print map(trans, ['adam', 'LISA', 'barT'])
