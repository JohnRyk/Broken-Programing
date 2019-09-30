#!/bin/sh

if [ $# -lt 2 ] ; then
	echo "Usage: <ip> [port_1] [port_2] [port_3] ..."
else
	echo "\n---------------------------------"
	echo " [*] Your target: $1"
	echo "---------------------------------\n"
	for i in $*
	do
		nping --tcp -p $i --flags syn -c 1 $1
	done
fi
