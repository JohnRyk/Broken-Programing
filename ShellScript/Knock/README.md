Try it ! And you will know how dose it work.



## Install:

```markdown
	apt install knockd
```

## RT?M:

```markdown
	more /usr/share/doc/knockd/README
```

## config:

```markdown
#Firstly config you iptables such as:
	iptable -A INPUT -p tcp -dport 22 -j REJECT
	vim /etc/knockd.conf
#set START_KNOCKD to 1:
	vim /etc/default/knockd
	service knockd restart
```



Notice the default configuration :

​	seq to open SSH is : 7000->8000->9000

​	And to close SSH is: 9000->8000->7000

​	The seq_timeout is 5 second and the tcpflag is syn (It means we need to send SYN packet to trigger)



## knock:

​	knock will be install with knockd





## using nmap to knock:

```shell
#nmap tcp SYN flag knock port 31、44、55
# -r: Scan ports consecutively - don't randomize
	nmap -sS -r 192.168.1.202 -p31,44,55
```



## using nping to knock:

```shell
#nping tcp SYN flag knock port 31、44、55
	nping --tcp -p 31,44,55 --flags syn -c 1 192.168.1.202
```









