#!/bin/bash

net_id=`ifconfig |grep 'inet' |awk '{print $2}' |head -n 1 |awk -F '.' '{print $1"."$2"."$3}'`

for i in `seq 1 1 10`
do
	echo $i
	ping -w 1 -c 1 "$net_id.$i" >> output.txt
done
