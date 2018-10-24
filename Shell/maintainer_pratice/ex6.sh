#!/bin/bash

# 四.shell条件分支结构语句
# 1.单分支判断语句
# 格式：if 条件 ; then 结果 fi ，最后面一定要有fi，在shell脚本里面，控制分支结构结束都要和开头的单词相反，例如，if <–> fi，case <–> esac。

echo "please input a filename: "
read filename
if [ -x $filename ];then
echo "this file can executable."
else
echo "this file can not executable."
fi
