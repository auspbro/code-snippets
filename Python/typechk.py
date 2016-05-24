#!/usr/bin/env python

def displayNumType(num):
	print num, 'is',
	if isinstance(num, (int, long, float, complex)):
		print 'a number of type:', type(num).__name__
	else:
		print 'not a number at all!!'

displayNumType(-69)
displayNumType(9999999999999999L)
displayNumType(999.3)
displayNumType(-2.5+1.9j)
displayNumType('xxx')
