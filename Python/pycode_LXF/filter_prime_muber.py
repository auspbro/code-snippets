#!/usr/bin/python
# coding: UTF-8

def primer_number(n):
    return n % 2 == 1

L = range(1, 100)
print filter(primer_number, L)