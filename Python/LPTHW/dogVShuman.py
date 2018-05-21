#!/usr/bin/python
# coding: utf-8


class Person(object):
    role = 'Person'

    def __init__(self, name, aggressivity, life_value):
        self.name = name
        self.aggressivity = aggressivity
        self.life_value = life_value

    def attack(self, dog):
        dog.life_value -= self.aggressivity


class Dog(object):
    role = 'dog'

    def __init__(self, name, breed, aggressivity, life_value):
        self.name = name
        self.breed = breed
        self.aggressivity = aggressivity
        self.life_value = life_value

    def bite(self, people):
        people.life_value -= self.aggressivity


person1 = Person('Ryan', 10, 1000)
dog1 = Dog('二愣子', '哈士奇', 10, 1000)
print(dog1.life_value)
person1.attack(dog1)
print(dog1.life_value)