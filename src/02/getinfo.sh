#!/bin/bash

echo "HOSTNAME = $HOSTNAME"
echo "TIMEZONE =" $(timedatectl | grep "Time zone" | awk -F ': ' '{print $2}')
echo "USER = $USER"
echo "OS =" $(grep PRETTY_NAME /etc/*-release | awk -F '"' '{print $2}')
echo "DATE =" $(date +"%d %b %Y %T")
echo "UPTIME =" $(uptime -p)
echo "UPTIME_SEC =" $(cat /proc/uptime | awk -F ' ' '{print $1}')
echo "IP =" $(ifconfig | grep "inet" | awk '(NR == 2)' | awk -F ' ' '{print $2}')
echo "MASK =" $(ifconfig | grep "inet" | awk '(NR == 2)' | awk -F ' ' '{print $4}')
echo "GATEAWAY =" $(ip route | grep default | awk -F ' ' '{print $3}')
echo $(free | awk -F ' ' '{print $2}' | awk '(NR == 2)' | awk '{printf("RAM_TOTAL = %.3f GB\n", $1/1024/1024)}')
echo $(free | awk -F ' ' '{print $3}' | awk '(NR == 2)' | awk '{printf("RAM_USED = %.3f GB\n", $1/1024/1024)}')
echo $(free | awk -F ' ' '{print $4}' | awk '(NR == 2)' | awk '{printf("RAM_FREE = %.3f GB\n", $1/1024/1024)}')
echo $(df -T / | grep "/" | awk -F ' ' '{printf("SPACE_ROOT  = %.2f MB", $3/1024)}')
echo $(df -T / | grep "/" | awk -F ' ' '{printf("SPACE_ROOT_USED = %.2f MB", $4/1024)}')
echo $(df -T / | grep "/" | awk -F ' ' '{printf("SPACE_ROOT_FREE  = %.2f MB", $5/1024)}')