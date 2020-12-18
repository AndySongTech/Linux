#!/bin/bash
read -p "Please input the file that you want to copy: " file
if [ -f $file -o -d $file ]; then
  read -p "Are you confirm to copy $file?(y/n)" sure
  confirm=$(echo ${sure} | tr A-Z a-z)
  if [ "$confirm" == "y" ]; then
    read -p "Please input the destination directory: " dest
    dest_dir=$(echo ${dest})
    if [ -d $dest_dir ]; then
      cp $file $dest_dir
      echo "The $file has been moved to $dest_dir!"
    else
      echo "The destination is not exist"
      exit 1
    fi
  elif [ "$confirm" == "n" ]; then
    echo "Bye"
  else
    echo "Please input y/n: "
  fi
else
  echo "The is not exsit"
fi
