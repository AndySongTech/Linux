#!/bin/bash
while true
do
  num=`who | wc -l `
  num1=$(($num-2))
  echo " Current session is $num1" >> /root/shell/tty.txt
  sleep 1
  
done

# bash while_monitor_tty.sh &  # 在后台执行
# nohup bash while_monitor_tty.sh &  # 在后台执行,及时terminal关掉，依然会秩序写入tty.txt
# tail -f /root/shell/tty.txt   # 秩序显示tty.txt里的更新内容
