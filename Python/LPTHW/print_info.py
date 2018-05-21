#!/usr/bin/python
# coding: utf-8

class Person(object):
    def __init__(self, name, age, sex):
        self.name = name
        self.age = age
        self.sex = sex

    def habit1(self):
        print "上山去砍柴"
    def habit2(self):
        print "开车去东北"
    def habit3(self):
        print "最爱大保健"

p1 = Person('小明', '10岁', '男')
p2 = Person('老李', '90岁', '男')

print "%s, %s, %s," % (p1.name, p1.age, p1.sex),
print_hb1 = p1.habit1()
print "%s, %s, %s," % (p1.name, p1.age, p1.sex),
print_hb2 = p1.habit2()
print "%s, %s, %s," % (p1.name, p1.age, p1.sex),
print_hb3 = p1.habit3()
print "%s, %s, %s," % (p2.name, p2.age, p2.sex),
print_hb3 = p2.habit1()
print "%s, %s, %s," % (p2.name, p2.age, p2.sex),
print_hb3 = p2.habit2()
print "%s, %s, %s," % (p2.name, p2.age, p2.sex),
print_hb3 = p2.habit3()