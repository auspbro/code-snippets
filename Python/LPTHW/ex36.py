#!/usr/bin/python
# -*- coding: utf-8 -*-

from sys import argv

name = raw_input("请为自己取名>>>>>")


def start():
    city_list = ['上海', '苏州', '盐城']
    for city in city_list:
        print "这是你的选择之一:%s." % city
        #如果这里接下来还有其他的print，会导致for函数只输出一个值。

    print "你想留在那个城市>>>>>>>>"

    next = raw_input(">")

    if "上海" in next:
        shanghai()
    elif "苏州" in next:
        suzhou()
    elif "盐城" in next:
        yancheng()
    else:
        print "你必须要做出一个选择，少年%s." % name


def shanghai():

    print "你好，%s!,上海是一个充满机会的城市，你愿意留下来吗？Y/N" % name

    next = raw_input(">")
    if "Y" in next:
        print "在这里，您可以成长成为早教师，GOOD JOB!"
    elif "N" in next:
        print "回老家去吧，乡村少年。"
        yancheng()  #跳至yancheng函数。
    else:
        dead("成为流浪者吧，少年！")


def suzhou():
    print "你好，苏州是充满机会的城市. %s,你觉得得付出百分几的代价来成为老板？" % name
    x = False

    while True:
        next = int(raw_input(">"))

        if next <= 50:
            print("成功不属于你！%s") % name
        elif next >= 80 and not x:
            print "你有机会成功"
        elif 50 <= next <= "80" and not x:
            print "少年,机会有点渺茫啊"
        else:
            print "少年,把你真实想法写下来吧。"


def dead(why):
    print why, "good job"
    exit(0)


def yancheng():
    print "盐城，青山绿水，欢迎您"
    print "空气清新，就是工作机会没有这么多而已"
    print "您要逃离？还是留守？"

    while True:
        next = raw_input(">")

        if "逃离" in next:
            start()
        elif "留守" in next:
            print "您愿意用百分之几的努力来完成养猪任务？"
            x = False

            while True:
                next = int(raw_input(">"))
                if next <= 50:
                    print("成功不属于你！%s") % name
                elif next >= 80 and not x:
                    print "你有机会成功"
                elif 50 <= next <= "80" and not x:
                    print "少年,机会有点渺茫啊"
                else:
                    print "少年,把你真实想法写下来吧。"
        else:
            print "做出一个选择吧，少年。"


start = start()
