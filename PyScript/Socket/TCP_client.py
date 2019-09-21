#!/usr/bin/python

import socket
import optparse

parser = optparse.OptionParser('Usage %prog -t <Target IP> -p <Port>')

parser.add_option('-t',dest='tgtIP',type='string',help='Specify an IP to connect')
parser.add_option('-p',dest='tgtPort',type='int',help='Specity a port to connect')

(options,args) = parser.parse_args()

tgtIP = options.tgtIP
tgtPort = options.tgtPort

if (tgtIP==None) | (tgtPort==None):
    print(parser.usage)
    exit(0)

s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
s.connect((tgtIP,tgtPort))

msg='Hey my friend'
s.send(bytes(msg,'UTF-8'))
data = s.recv(1024)

print ('Received: ',repr(data))
s.close()
