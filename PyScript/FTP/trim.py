import os
import sys

def trim(filename):
    fi = open(filename,'r')
    for line in fi.readlines():
        if(" " in line):
            f1 = line.split(" ")[0].rstrip()
            print(f1+":"+f1)

trim("wl.txt")
