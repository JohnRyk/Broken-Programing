#!/usr/bin/expect
# Author: Ryk.Zen
# Require: expect
# Modify to your password (In this case is 123456)
# You can also su to ohter account

set PASSWORD 123456
spawn su 
expect -nocase "password:"
send "$PASSWORD\r"
interact
