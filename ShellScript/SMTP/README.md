# nc

```shell
nc 192.168.1.1 << EOF
	HELO host.me.com
	MAIL FROM: me@xx.com
	RCPT TO: targetUser@xx.com
	DATA
	.......write something here.......
	QUIT
	EOF
```

Check it. Maybe you can send some email to the target host.

Or you can try to brute username if the VRFY func was enable.