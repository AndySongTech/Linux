#!/bin/bash
while true
mem=echo ` free -h | grep -i mem | cut -d M -f 4 | tr -d " " `
do 
  if [ $mem -lt 500 ]; then 
      echo "The free memory is less than 500MB, please check it out" | mail -s " Memory is Not Enough !!! " andy.song@tech.io
      break  # 只发送一次报警
  fi

done
