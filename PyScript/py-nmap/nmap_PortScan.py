#!/usr/bin/python

#############################
'''pip install python-nmap'''
#############################

import nmap
# Using sync scanning module 
nm = nmap.PortScanner()
nm.scan(hosts='192.168.1.0/24',ports='None',arguments='-sP')

# print scanning targets
print(nm.all_hosts())

# print the nmap command which you using
print(nm.command_line())

# Using Async scanning module
nma = nmap.PortScannerAsync()

