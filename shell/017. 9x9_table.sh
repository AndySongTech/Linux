#!/bin/bash
for i in `seq 9`
do
  for a in `seq 9`
  do
    if [ $a -le $i ]; then
      echo -n "$a*$i=$(($a*$i)) "
    fi

  done
  echo ""
done
