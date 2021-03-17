#!/bin/bash

for time in `seq 10 -1 0`
do
   echo -n -e "\b$time"
   sleep 1
done
echo
