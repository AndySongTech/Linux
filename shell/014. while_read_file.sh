#!/bin/bash
cat ./tty.txt | while read line
do
  echo "$line"
  sleep 1

done
