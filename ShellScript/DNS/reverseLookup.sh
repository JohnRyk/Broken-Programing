#!/bin/sh
for ip in $(seq 1 255);do host 10.11.1.$ip;done |grep -v "not found"
