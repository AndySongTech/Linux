#!/bin/bash
useradd shelltest
touch /home/shelltest/try.html
cat /etc/passwd | wc -l
yum list installed | wc -l 
# or rpm -qa | wc -l 

# 练习1：使用root用户帐号创建并执行test2.sh，实现创建一个shelltest用户，并在其家目录中新建文件try.html。
# 练习2：统计当前系统总共有多少用户
# 练习3：统计当前已经安装的软件数量
