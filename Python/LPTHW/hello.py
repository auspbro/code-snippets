#!/usr/bin/python
# coding: utf8

'a test module'

__author__ = 'Ryan xue'

import sys


def main():
    args = sys.argv
    if len(args) == 1:
        print "Hello, World"
    elif len(args) == 2:
        print "Hello, %s" % args[1]
    elif len(args) == 3:
        print "Hello, %s, %s" % (args[1], args[2])
    else:
        print "Too many arguments."


if __name__ == '__main__':
    main()