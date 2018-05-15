#!/usr/bin/python
# -*- coding: utf-8 -*-

from sys import argv
script, food_01, food_02 = argv


def trap(food_01, food_02):
    """这是一个陷阱"""

    print "欢迎来到光头强和狗熊的游戏。\n这个游戏里，\n光头强已经在狗熊洞的外面挖好了陷阱，\n正准备放上诱饵。"

    print "他在陷阱上面放上了狗熊最喜欢吃的两种食物：\n>%s和%s" % (food_01, food_02)

    print "这里有%s和%s" % (food_01, food_02)

    next_01 = raw_input("熊二你准备怎么办呢？\n>")

    next_02 = raw_input("熊大你准备怎么办呢？\n>")

    if next_01 == "去拿它" and next_02 == "去拿它":

        question("哈哈，这是一个陷阱，你们都掉进来了\n你们必须逃出去，否则将会饿死")

    elif next_01 == "去拿它" or next_02 == "去拿它":

        question("你的同伴为了拿它掉进了陷阱，现在你必须救出他，不然他会活活饿死")

    else:

        question_02("你们真厉害，居然认出来这是个陷阱！\n")


def question(text_01):

    print text_01, "如果想要从这里出去，就必须答对我的问题。"

    answer = raw_input("请回答：0.5/2\n>")

    if answer == "0.25":

        question_02("没想到居然答对了！\n好了，你们现在可以出去了\n")

    else:

        dead("答错了，你将被困在这里永远也别想出去了！")


def question_02(text_02):

    print text_02, "咚咚咚...陷阱升起来了，又回到了地面。\n你们没有这么容易逃走了。\n突然，一个笼子从天而降，困住了他们。"

    answer_02 = raw_input("现在你们回答我另外一个问题，笼子才会打开。\n请回答：2+10*2的值\n>")

    if answer_02 == "22":

        print "答案正确。\n恭喜你们成功阻止了光头强的阴谋。\n游戏过关。"

    else:

        dead("对不起，你回答错了，将会被困在这里饿死。\n")


def dead(text_03):

    print text_03, "Game Over!"


trap(food_01, food_02)
