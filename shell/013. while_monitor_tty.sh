#!/bin/bash
while true
do
  num=`who | wc -l `
  num1=$(($num-2))
  echo " Current session is $num1" >> /root/shell/tty.txt
  sleep 1
  
done

# 运行脚本：
# bash while_monitor_tty.sh  # 在current终端运行，退出或关闭终端脚本及停止运行
# bash while_monitor_tty.sh & # 在后台运行， 关闭终端后脚本后停止运行
# nohup bash while_monitor_tty.sh &  # 在后台运行，不挂起，在服务器运行的情况下可以一直运行,会持续把输出写入到tty.txt，即使终端关闭或退出。
# tail -f /root/shell/tty.txt   # 持续显示tty.txt里的更新内容
# 终止脚本运行：
# ps -aux | grep while_monitor_tty.sh  # 找到相应的进程PID
# kill -9 15470  # kill 对应的进程既可以终止脚本运行
