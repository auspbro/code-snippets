#!/usr/bin/python
# -*- coding: utf-8 -*-



formatter = "%r %r %r %r"
formatter2 = "%s %s %s %s"

print formatter % (1, 2, 3, 4)
print formatter % (u"one你好", "two", "three", "four")
print formatter % (True, False, False, True)
print formatter % (formatter, formatter, formatter, formatter)
print formatter % ("I had this thing.", "That you could type up right.", "But it didn't sing.", 'So I said goodnight.')

print formatter2 % (1, 2, 3, 4)
print formatter2 % (u"one你好", "two", "three", "four")
print formatter2 % (True, False, False, True)
print formatter2 % (formatter, formatter, formatter, formatter)
print formatter2 % (
	'I had this thing.',
	"That you could type up right.", 
	"But it didn't sing.", 
	"So I said goodnight."
	)


print u"中华人民共和国"