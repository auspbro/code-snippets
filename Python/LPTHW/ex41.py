<<<<<<< HEAD

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

			
=======
import random
from urllib import urlopen
import sys

WORD_URL = "http://learncodethehardway.org/wods.txt"
WORDS = []

PHRASES = {
	"class ###(###):":
	"Make a class named ### that is-a ###.",
	"class ###(object):\n\tdef __init__(self, ***)":
	"class ### has-a __init__ that takes self and *** parameters.",
	"class ###(object):\n\tdef ***(self, @@@)":
	"class ### has-a function named *** that takes self and @@@ parameters.",
	"*** = ###()":
	"set *** to an instance of class ###.",
	"***.***(@@@)":
	"From *** get the *** function, and call it with parameters self, @@@.",
	"***.*** = '***'":
	"From *** get the *** attribute and set it to '***'",

}

# do they want to drill phrases first
PHRASE_FIRST = False
if len(sys.argv) == 2 and sys.argv[1] == "english":
	PHRASE_FIRST = True


# load up the words from the web side
for word in urlopen(WORD_URL).readlines():
	WORDS.append(word.strip())


def convert(snippet, phrase):
	class_names = [w.capitalize() for w in
	random.sample(WORDS, snippet.count("###"))]

	other_names = (WORDS, snippet.count("***"))
	results = []
	param_names = []

for i in range(0, snippet.count("@@@")):
	param_count = random.randint(1, 3)
	param_names.append(', '.join(random.sample(WORDS, param_count)))

for sentence in snippet, phrase:
	result = sentence[:]

	# fake class name
	for word in class_names:
		result = result.replace("###", word, 1)

	# fake other name
	for word in other_names:
		result = result.replace("***", word, 1)

	# fake parameters list
	for word in param_names:
		result = result.replace("@@@", word, 1)
		
>>>>>>> 8bde1c1385f386b6a9f66e3e5cae7ebe37393500
