#!/bin/bash
sum=0
for i in `seq 2 2 100`
do

 let sum+=$i

done
echo $sum
