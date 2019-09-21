#!/bin/bash

echo PortSweeper
echo This script will scan the port in the hostlist between 10.11.1.0-254
echo
echo set a tcp port to start scan:
read portNum
port=$portNum
addr='10.11.1.'
echo test port $port
echo from "$addr"1 to 254
for i in `seq 1 1 154`
	do
		nc -nz 1 $addr$i $port &>> portScanResult
	done
cat portScanResult | grep succeeded | cut -d " " -f 3 > ipList
