#!/bin/bash

name_back=`tput setab $1`
name_font=`tput setaf $2`
out_back=`tput setab $3`
out_font=`tput setaf $4`
normal=`tput sgr 0`

echo -e "$name_font""$name_back"HOSTNAME"$normal" = "$out_font""$out_back"$HOSTNAME"$normal"
echo -e "$name_font""$name_back"TIMEZONE"$normal"  =  "$out_font""$out_back"$(timedatectl | grep "Time zone" | awk -F ': ' '{print $2}')"$normal"
echo -e "$name_font""$name_back"USER"$normal" =  "$out_font""$out_back"$USER"$normal"
echo -e "$name_font""$name_back"OS"$normal" =  "$out_font""$out_back"$(grep PRETTY_NAME /etc/*-release | awk -F '"' '{print $2}')"$normal"
echo -e "$name_font""$name_back"DATE"$normal" = "$out_font""$out_back"$(date +"%d %b %Y %T")"$normal"
echo -e "$name_font""$name_back"UPTIME"$normal" = "$out_font""$out_back"$(uptime -p)"$normal"
echo -e "$name_font""$name_back"UPTIME_SEC"$normal" = "$out_font""$out_back"$(cat /proc/uptime | awk -F ' ' '{print $1}')"$normal"
echo -e "$name_font""$name_back"IP"$normal" = "$out_font""$out_back"$(ifconfig | grep "inet" | awk '(NR == 2)' | awk -F ' ' '{print $2}')"$normal"
echo -e "$name_font""$name_back"MASK"$normal" = "$out_font""$out_back"$(ifconfig | grep "inet" | awk '(NR == 2)' | awk -F ' ' '{print $4}')"$normal"
echo -e "$name_font""$name_back"GATEAWAY"$normal" = "$out_font""$out_back"$(ip route | grep default | awk -F ' ' '{print $3}')"$normal"
echo -en "$name_font""$name_back"RAM_TOTAL"$normal" = "$out_font""$out_back"; echo -e $(free | awk -F ' ' '{print $2}' | awk '(NR == 2)' | awk '{printf("%.3f GB\n", $1/1024/1024)}')"$normal"
echo -en "$name_font""$name_back"RAM_USED"$normal" = "$out_font""$out_back";echo -e $(free | awk -F ' ' '{print $3}' | awk '(NR == 2)' | awk '{printf("%.3f GB\n", $1/1024/1024)}')"$normal"
echo -en "$name_font""$name_back"RAM_FREE"$normal" = "$out_font""$out_back";echo -e $(free | awk -F ' ' '{print $4}' | awk '(NR == 2)' | awk '{printf("%.3f GB\n", $1/1024/1024)}')"$normal"
echo -e "$name_font""$name_back"SPACE_ROOT"$normal" = "$out_font""$out_back"$(df -T / | grep "/" | awk -F ' ' '{printf("%.2f MB", $3/1024)}')"$normal"
echo -e "$name_font""$name_back"SPACE_ROOT_USED"$normal" = "$out_font""$out_back"$(df -T / | grep "/" | awk -F ' ' '{printf("%.2f MB", $4/1024)}')"$normal"
echo -e "$name_font""$name_back"SPACE_ROOT_FREE"$normal"  = "$out_font""$out_back"$(df -T / | grep "/" | awk -F ' ' '{printf("%.2f MB", $5/1024)}')"$normal"
