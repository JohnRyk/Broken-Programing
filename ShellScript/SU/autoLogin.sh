#!/usr/bin/expect

set password lili
spawn su 
expect -nocase "password:"
send "$password\r"
expect eof
