#!/bin/bash

echo Input target IP
read IP
echo Default port: 25
echo Input wordlist path
read wdPath


for uname in `cat $wdPath`
do
	echo "[*] Trying: $uname"
	`echo "VRFY $uname" | timeout -s 9 1 nc -nv $IP 25 >> result`
done
