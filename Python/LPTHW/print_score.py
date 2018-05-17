#!/usr/bin/python
# coding: utf8

'a test module'

__author__ = 'Ryan Xue'

std1 = {'name': 'Ryan', 'score': 99}
std2 = {'name': 'Alex', 'score': 89}


# print score
def main(std):
    print '%s: %s' % (std['name'], std['score'])


if __name__ == '__main__':
    main(std1)