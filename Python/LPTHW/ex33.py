
# while i < 9:
# 	print "At the top i is %d" % i
# 	number.append(i)
# 	i = i + 1
# 	print "Number now: ", number
# 	print "At the bottom i is %d" % i

# print "The Number:"

# for num in number:
# 	print num

i = 0
number = []
def list_loop(counts):
	global i
	while i < counts:
		number.append(i)
		i += 1
		print "Number now: ", number

counts = input("input a number: ")
new_num = list_loop(counts)
print "The numbers: ", new_num
