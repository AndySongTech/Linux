#!/bin/bash
read -p " Please input the App name: " name
if rpm -q $name &>/dev/null; then
  echo " $name is installed"
  
else
  echo " $name is not installed"
  
fi
