#!/usr/bin/bash
clear
echo "CentOS Linux 7 (Core)"
echo -e "kernel `uname -r` and `uname -m`\n"
echo -e -n "`$HOSTNAME` login: "
read account
echo -n -s "password: "    # -s is for hide input
read passwd
#echo "Account: $account   Password: $password"
