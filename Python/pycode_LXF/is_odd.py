#!/usr/bin/python
# coding: UTF-8

def is_odd(n):
    return n % 2 == 1

L = [1, 2, 4, 5, 6, 9, 10, 15]
print filter(is_odd, L)

