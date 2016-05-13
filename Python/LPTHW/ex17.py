
from sys import argv
from os.path import exists

script, from_file, to_file = argv

print "Copying from %s to %s." % (from_file, to_file)

# We could do these two on one line too, how?
in_file = open(from_file)
indata = in_file.read()

print "The input file is %s bytes long" % len(indata)

print "Does the output file exists?" % exists(to_file)
print "Ready? Hint <Enter> key continue, hint <CTRL+C> abort."

