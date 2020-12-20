#!/bin/bash
clear
num=`echo "$RANDOM" | cut -c 1-2`
while true
do
  read -p "Input the number in range 0-99: " num1
  if [ $num1 -lt $num ]; then
    echo "The number is greater than your input, try it again. "
    continue
    
  elif [ $num1 -ge 100 ]; then
    echo " The number is exceed the rang. "
    continue
    
  elif [ $num1 -gt $num ]; then
    echo " The number is less than your input, try it again. "
    continue
  
  elif [ $num1 -eq $num ]; then
    echo " You got it. Awesome!!! "
    break
  else
    echo " See you next time. "
    exit

  fi
done
