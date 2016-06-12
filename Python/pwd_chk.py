#!/usr/bin/env python
# -*- coding: utf-8 -*-

valid = False
count = 3
passwdList = ['HelloWorld', 'kobekobe', 'Hel1oW0rld']
while count > 0:
	input = raw_input("enter password")
	# check for valid password
	for eachpasswd in passwdList:
		if input == eachpasswd:
			valid = True
			break
	if not valid:
		print "invalid input"
		count -= 1
		continue
	else:
		break