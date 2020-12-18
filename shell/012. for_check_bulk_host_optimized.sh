#!/bin/bash
. /etc/init.d/functions
ip=172.16.101.
for i in {1..100}
  do
  if ping -c 1 -w 1 $ip$i &>/dev/null; then
    echo -n  "$ip$i"
    success
    echo ""
  else
    echo -n  "$ip$i"
    failure
    echo ""
  fi

  done
