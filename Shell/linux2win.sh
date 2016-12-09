#!/bin/bash
sudo sed -i 's/set default="0"/set default="2"/g' /boot/grub/grub.cfg
sudo reboot