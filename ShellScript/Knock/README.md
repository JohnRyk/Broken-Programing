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
	vim /etc/knockd.conf
	service knockd restart
```



Notice the default configuration :

​	seq to open SSH is : 7000->8000->9000

​	And to close SSH is: 9000->8000->7000

​	The seq_timeout is 5 second and the tcpflag is syn (It means we need to send SYN packet to trigger)



## knock:

​	knock will be install with knockd



















