#!/usr/bin/env python
# -*- coding: utf-8 -*-

def phone(brand, types):
	print "My phone brand is %s." % brand
	print "My phone type is %s." % types
	print "Pretty good! I use %s %s now." % (brand, types)

print "***1***"
phone("iphone", '5S')

print "***2***"
phone_brand = 'Meizu'
phone_types = 'pro6'
phone(phone_brand, phone_types)

print "***3***"

