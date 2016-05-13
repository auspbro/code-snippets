
from sys import argv

script, filename = argv

print "We are going to erase %r." % filename
print "If you don't want that, please hint <CTRL-C>(^C)."
print "If you do want that, hint <Enter> key."

raw_input("?")

print "Opening the file..."
target = open(filename, 'w')

print "Truncating the file, goodbye!"
target.truncate()

print "Now, I'm going to ask you three lines."

line1 = raw_input("line 1:")
line2 = raw_input("line 2:")
line3 = raw_input("line 3: ")

print "Now, I'm going to write these to file."
target.write(line1)
target.write("\n")
target.write(line2)
target.write("\n")
target.write(line3)
target.write("\n")

print "And finally, we close it."
target.close()


