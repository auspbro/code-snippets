#!/usr/bin/env python
# -*- coding: utf-8 -*-

db = {}

def newuser():
	prompt = 'Login desired: '
	while True:
		name = raw_input(prompt)
		if db.has_key(name):
			prompt = 'name taken, try another: '
			continue
		else:
			break
	pwd = raw_input('password: ')
	db[name] = pwd

def function():
	pass