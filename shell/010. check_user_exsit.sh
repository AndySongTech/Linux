#!/bin/bash
read -p " Input the user name: " user_name
if cat /etc/passwd | cut -d : -f 1 | grep $user_name &>/dev/null; then
  echo "$user_name is exsiting "
else
  echo "$user_name is not exsiting"
fi
