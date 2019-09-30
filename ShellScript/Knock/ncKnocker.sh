#!/bin/bash

echo
echo "TCP SYN flag port knocker using nc:"
echo "   Usage: ./$0 <Target IP> [port1] [port2] [port3] ..."
echo

if [ $# -lt 2 ] ; then
	echo "   Your are knocking air !"
else
	count=`expr $# - 1`		# wipe off the target ip
	num=1
	while [ $count -ne 0 ]
	do
		nc -nv $1 "$`$num`"
		num=$(($num + 1))
		count=$(($count - 1))
	done
fi
