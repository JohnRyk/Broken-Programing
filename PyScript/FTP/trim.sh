#!/bin/sh

for line in `wl.txt`
do
	echo $line #|awk '{ print $1 }'
done
