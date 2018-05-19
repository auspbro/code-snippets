#!/usr/bin/python


def mycomputer(*args):
    arg1, arg2, arg3, arg4 = args
    print "HDD size: %d" % arg1
    print "memory size: %d" % arg2
    print "LCD type: %s" % arg3
    print "CPU type: %s" % arg4
    print "Get a blanket.\n"


print "Show me the computer components:"
mycomputer(128, 8, 'THD', 'I7')

print "Show me the computer components2:"
hdd_size = 500
ram_size = 8
mycomputer(hdd_size, ram_size, 'ibk', 'i9')
