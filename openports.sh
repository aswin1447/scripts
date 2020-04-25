#!/bin/bash
for ip in 172.29.3.{1..254}; do
     if ping -c 1 -W 1 $ip >/dev/null  # ping.sh $ip;
    then
      nmap -p1-2000 $ip
     fi

done
