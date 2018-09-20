#!/usr/bin/env python
# -*- coding:utf-8 -*-
# __Author__ = "Xiang Xue"
# __date__ = "2018/09/20"
# __Desc__ = 一个最简单的类似于Java的MessageBox的小窗口

import easygui as g

msg = "请填写一下信息(其中带*号的项为必填项)"
title = "账号中心"
fieldNames = ["*用户名","*真实姓名","固定电话","*手机号码","QQ","*Email"]
fieldValues = []
fieldValues = g.multenterbox(msg,title,fieldNames)
#print(fieldValues)
while True:
    if fieldValues == None :
        break
    errmsg = ""
    for i in range(len(fieldNames)):
        option = fieldNames[i].strip()
        if fieldValues[i].strip() == "" and option[0] == "*":
            errmsg += ("【%s】为必填项   " %fieldNames[i])
    if errmsg == "":
        break
    fieldValues = g.multenterbox(errmsg,title,fieldNames,fieldValues)
print("您填写的资料如下:%s" %str(fieldValues))