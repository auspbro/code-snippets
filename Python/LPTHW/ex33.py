# while i < 9:
# 	print "At the top i is %d" % i
# 	number.append(i)
# 	i = i + 1
# 	print "Number now: ", number
# 	print "At the bottom i is %d" % i

# print "The Number:"

# for num in number:
# 	print num

# =======================
# while loop function
# i = 0
# number = []
# def list_loop(counts):
# 	global i
# 	while i < counts:
# 		number.append(i)
# 		i += 1
# 		print "Number now: ", number
# 	return number

# counts = input("input a number: ")
# new_num = list_loop(counts)
# print "The new numbers: ", new_num

# ============
# for loop function
i = 0
number = []


def list_loop(input_by_user):
    global i
    for i in range(input_by_user):
        number.append(i)
        i += 1
        print "Number now: ", number
    return number


input_by_user = input("please input a number: ")
new_num = list_loop(input_by_user)
print "The new numbers: ", new_num
