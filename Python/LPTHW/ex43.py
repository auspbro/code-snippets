#!/usr/bin/env python
# -*- coding: utf-8 -*-
# history: 

'''
description: 
'''

# just checking
__author__ = 'Ryan Xue'
__version__ = '1.0'

import random
from urllib import urlopen
import sys

WORD_URL = "http://learncodethehardway.org/words.txt"
WORDS = []

PHRASES = {
    "class ###(###):":
    "Make a class named ### that is-a ###.",
    "class ###(object):\n\tdef __init__(self, ***)":

    "class ### has-a __init__ that takes self and *** parameters.",

    "class ###(object):\n\tdef ***(self, @@@)": "class ### has-a function named *** that takes self and @@@ parameters.",

    "*** = ###()":

    "Set *** to an instance of class ###.",

    "***.***(@@@)":

    "From *** get the *** function, and call it with parameters self, @@@.",

    "***.*** = '***'":

    "From *** get the *** attribute and set it to '***'."
}

