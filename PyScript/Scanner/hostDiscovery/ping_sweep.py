#!/usr/bin/python
import os

print("This script default to scan 253 ipaddress in first local interface with netmask 255.225.255.0\n")
cmd_str= " net_id=`ifconfig | grep 'inet' | awk '{print $2}' | head -n 1 | awk -F '.' '{print $1 "'"."'" $2 "'"."'" $3}'`; " 
print(cmd_str)



'''
net_id="10.11.1."

for i in range(0,255):
    os.system("ping -w 1 -c 1 %s%s" % (net_id,i))
'''
