#!/bin/bash
VAR=`ping -s 1 -c 2 192.168.1.231 > /dev/null; echo $?`
if [ $VAR -eq 0 ];then
echo -e "Home-SERVER is UP as on $(date)"
elif [ $VAR -eq 1 ];then
wakeonlan FF:FF:FF:FF:FF:FF | echo "Home-SERVER not turned on. WOL packet sent at $(date +%H:%M)"
sleep 3m | echo "Waiting 3 Minutes"
PING=`ping -s 1 -c 4 192.168.1.231 > /dev/null; echo $?`
if [ $PING -eq 0 ];then
echo "Home-SERVER is UP as on $(date +%H:%M)"
else
echo "Home-SERVER not turned on - Please Check Network Connections"
fi
fi
