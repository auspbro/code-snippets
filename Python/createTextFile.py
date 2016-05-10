#!/usr/bin/env python

'makeTextFile.py -- create text file'

import os
ls = os.linesep

# get filename
while True:

	fname = raw_input('Please input filename:')

	if os.path.exists(fname):
		print "ERROR: '%s' already exists" % fname
	else:
		break

# get file content (text) line
all = []
print "\nEnter lines ('.' by itself to quit).\n"

# loop until user terminate input
while True:
	entry = raw_input('> ')
	if entry == '.':
		break
	else:
		all.append(entry)

# Write lines to file with proper line-ending
fobj = open(fname, 'w')
fobj.writelines(['%s%s' % (x, ls) for x in all])
fobj.close()
print 'DONE!'

		