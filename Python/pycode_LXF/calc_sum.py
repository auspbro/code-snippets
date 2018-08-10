#!/usr/bin/python
# coding: utf-8

# def calc_sum(*args):
#     ax = 0
#     for n in args:
#         ax = ax + n
#     return ax

# print calc_sum(1, 3, 5, 7, 9)


def lazy_sum(*args):
    def sum():
        ax = 0
        for n in args:
            ax = ax + n
        return ax
    return sum

f = lazy_sum(1, 3, 5, 7, 9)
print f
print f()