#!usr/bin/python
# coding: utf8

# Create a mapping of state to abbreviation
states = {
    'Oregen': 'OR',
    'Florida': 'FL',
    'California': 'CA',
    'New York': 'NY',
    'Michigan': 'MI'
}

# Create a basic set of states and some cities in them
cities = {'CA': 'San Francisco', 'MI': 'Detroit', 'FL': 'Jacksonville'}

# add some more cities
cities['NY'] = 'New York'
cities['OR'] = 'Portland'

num_of_dash = 30
# print out some cities
print '-' * num_of_dash
print "NY state has: ", cities['NY']
print "OR state has: ", cities['OR']

# print some states
print '-' * num_of_dash
print "Michigan's abbreviation: ", states['Michigan']
print "California's abbreviation: ", states['California']

# do it by using the state then the cities dict
print '-' * num_of_dash
print "Michigan has cities: ", cities[states['Michigan']]
print "Floradia has cities: ", cities[states['Florida']]

# print every state abbreviation
print '-' * num_of_dash
for state, abbrev in states.items():
    print "%s is abbreviated %s" % (state, abbrev)

# print every city in state
print '-' * num_of_dash
for abbrev, city in cities.items():
    print "%s has the city %s" % (abbrev, city)

# now do both at the same time
print '-' * num_of_dash
for state, abbrev in states.items():
    print "%s is abbreviated %s and has city %s" % (state, abbrev, cities[abbrev])

# safely get a abbreviation by state that might not be there
print '-' * num_of_dash
state = states.get('Texas', None)

if not state:
    print "Sorry, no Texas."

# get a city which a default value
city = cities.get('TX', 'Does not exist')
print "The city for the state 'TX' is: %s" % city
