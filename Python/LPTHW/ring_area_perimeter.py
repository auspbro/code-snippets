# coding: utf-8

from math import pi


class Circle:
    '''
    定义了一个圆形类；
    提供计算面积(area)和周长(perimeter)的方法
    '''

    def __init__(self, radius):
        self.radius = radius

    def perimeter(self):
        return 2 * pi * self.radius

    def area(self):
        return pi * self.radius * self.radius


circle = Circle(10)
area1 = circle.area()
per1 = circle.perimeter()
print(area1, per1)


class Ring:
    '''
    定义了一个圆环类
    提供圆环的面积和周长的方法
    '''
    
    def __init__(self, radius_outside, radius_inside):
        self.circle_outside = Circle(radius_outside)
        self.circle_inside = Circle(radius_inside)

    def perimeter(self):
        return self.circle_outside.perimeter() + self.circle_inside.perimeter()

    def area(self):
        return self.circle_outside.area() - self.circle_inside.area()


ring = Ring(10, 5)
print(ring.perimeter())
print(ring.area())
