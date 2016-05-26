
class TheThing(object):
	"""docstring for TheThing"""
	def __init__(self):
		#super(TheThing, self).__init__()
		self.number = 0

	def some_function(self):
		print "I got called."

	def add_me_up(self, more):
		self.number += more
		return self.number


#two different things
a = TheThing()
b = TheThing()

a.some_function()
b.some_function()

print a.add_me_up(20)
print b.add_me_up(30)

print a.number
print b.number

class TheMultipler(object):
	"""docstring for TheMultipler"""
	def __init__(self, base):
		super(TheMultipler, self).__init__()
		self.base = base

	def do_it(self, m):
		return m * self.base

x = TheMultipler(a.number)
print x.do_it(b.number)

			
