#!/usr/bin/python
# coding: utf-8

class Person(object):
    role = 'person'

    def __init__(self, name, aggressivity, life_value, money):
        self.name = name
        self.aggressivity = aggressivity
        self.life_value = life_value
        self.money = money

    def attack(self, dog):
        dog.life_value -= self.aggressivity

class dog(object):
    role = 'dog'

    def __init__(self, name, breed, aggressivity, life_value):
        self.name = name
        self.breed = breed
        self.aggressivity = aggressivity
        self.life_value = life_value

    def bite(self, people):
        people.life_value -= self.aggressivity

class Weapon(object):
    def __init__(self, name, price, aggrev, life_value):
        self.name = name
        self.price = price
        self.aggrev = aggrev
        self.life_value = life_value

    def update(self, obj):
        obj.money -= self.price
        obj.aggressivity += self.aggrev
        obj.life_value += self.life_value

    def prick(self, obj):
        obj.life_value -= 500

lance = Weapon('')