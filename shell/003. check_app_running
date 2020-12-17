#!/bin/bash
NAME=crond
NUM=`ps -aux |grep $NAME | grep -cv grep`
if [ $NUM -eq 1 ]; then
  echo "$NAME is running"
else
  echo "$NAME is not running"

fi
