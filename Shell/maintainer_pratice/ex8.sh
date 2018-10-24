#!/bin/bash

echo "please input a command."
read cmd

case $cmd in
cpu)    echo "The cpu info is:"
        cat /proc/cpuinfo;;
mem)    echo "The memory info is:"
        cat /proc/meminfo;;
device) echo "The device info is:"
        cat /proc/scsi/device_info;;
*)      echo "Your input command is invalid."
esac
