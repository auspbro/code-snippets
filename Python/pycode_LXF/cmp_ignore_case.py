#!/usr/bin/python
# coding: UTF-8

def cmp_ignore_case(s1, s2):
    u1 = s1.upper()
    u2 = s2.upper()
    if u1 < u2:
        return -1
    if u1 > u2:
        return 1
    return 0

L = ['bob', 'about', 'Zoo', 'Credit']

print sorted(L, cmp_ignore_case)    