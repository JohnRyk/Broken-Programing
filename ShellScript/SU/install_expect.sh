#!/bin/bash

# An expect auto install (root privileage is required)
#
# Tested on: 
#	CentOS 7.6.1810 x86_64      gcc version 4.8.5 20150623 (Red Hat 4.8.5-36) (GCC)
#	Ubuntu 16.04.6 LTS	    gcc version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.11)

# wget "http://prdownloads.sourceforge.net/tcl/tcl8.4.20-src.tar.gz"
# wget "http://sourceforge.net/projects/expect/files/Expect/5.45/expect5.45.tar.gz"

tar -xzvf "tcl8.4.20-src.tar.gz"
tar -xzvf "expect5.45.tar.gz"

cd "tcl8.4.20/unix"
./configure --enable-shared --prefix=/usr/tcl

ls -l Makefile

make

make install

cp tclUnixPort.h ../generic/

cd "../../expect5.45"

./configure --prefix=/usr/expect --with-tcl=/usr/tcl/lib --with-tclinclude=../tcl8.4.20/generic/

make

make install

ln -s /usr/tcl/bin/expect /usr/expect/bin/expect

echo 'export PATH=$PATH:/usr/expect/bin' >> /etc/profile

source /etc/profile
source /etc/profile
