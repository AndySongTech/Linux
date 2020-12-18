#!/bin/bash
if ping -c 1 172.16.101.32 &>/dev/null; then
 echo "OK."
else
 echo "NO!"
fi
