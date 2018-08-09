#!/usr/bin/python
# coding: UTF-8

def reversed_cmp(x, y):
    if x > y:
        return -1
    if x < y:
        return 1
    return 0

L = [36, 6, 3, 92, 21]
print sorted(L, reversed_cmp)