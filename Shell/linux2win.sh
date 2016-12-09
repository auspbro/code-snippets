#!/bin/bash

# 首先开机或者重启，在启动项选择菜单处记住Windows OS对应的序号，从上至下的序号从0开始计数，我的Win10系统选项处于第3个，那么序号就应该是2，记住后，打开ubuntu系统。
sudo sed -i 's/set default="0"/set default="2"/g' /boot/grub/grub.cfg  # 数字"2"取决于启动项选择菜单处Windows那一列对应的序号
sudo reboot