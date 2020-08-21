#!/usr/bin/env bash

target_ip=$1
target_port=25
username_list=$2

for username in `cat $username_list`
do
   echo "[*] Trying: $username"
   res=`printf "VRFY $username\r\n\r\n" |  timeout -s 9 11 nc -nv $target_ip $target_port 2>/dev/null`
   if [ "`echo $res |grep 'User unknown'`" == "" ];then
       printf "[+] Found valid username: %s\n" "$username"
       echo $username >> valid_smtp_username_found.txt
   fi
done
