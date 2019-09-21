#!/usr/bin/python
###########################################
'''Using nc or client side to connect me'''
###########################################

import socket

HOST = 'localhost'
PORT = 1234

s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
s.bind((HOST,PORT))
s.listen(1)
print('Listing on: ',HOST,PORT)

conn,addr = s.accept()

print('Connect by',addr)

while 1:
    data = conn.recv(1024)
    msg = data.decode('UTF-8')
    print(msg)
    if not data:
        break
    elif (msg.lower()).rstrip('\n') == 'exit':
        break
    conn.send(bytes('get out!\n',"UTF-8"))

conn.close()
