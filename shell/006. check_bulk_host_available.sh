ip=172.16.101.
for i in {1..100}
  do 
  if ping -c 1 $ip$i &>/dev/null; then
    echo "$ip$i is running"
  else 
    echo "$ip$i is not running"
  fi
  done
