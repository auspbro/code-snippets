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


class Dog(object):
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


lance = Weapon('长矛', 200, 10, 1000)
person1 = Person('capt', 10, 1000, 500)
dog1 = Dog('二愣子', '哈士奇', 10, 1000)

# egg独自力战"二愣子"深感吃力，决定穷毕生积蓄买一把武器
if person1.money > lance.price:
    lance.update(person1)
    person1.weapon = lance

print(person1.money, person1.life_value, person1.aggressivity)
print(dog1.life_value)
person1.attack(dog1)
print(dog1.life_value)
person1.weapon.prick(dog1)
print(dog1.life_value)
