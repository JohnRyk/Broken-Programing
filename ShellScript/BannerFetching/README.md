# Unknown port:

## nc:

```shell
#HEAD
echo -n "HEAD / HTTP/1.1\r\n\r\n" | nc -w 5 -nv 192.168.1.1 80
#GET
echo -n "HEAD / HTTP/1.1\r\n\r\n" | nc -w 5 -nv 192.168.1.1 80
#or try HTTP/1.0
```

​	In some version it do not work.

## tcpdump:

​	Analyze the traffic is also a good way.

```

```

## nmap:

​	You good in it.

```shell
nmap --script bannser
```

## amap:

​	I also like check the unknown port using amap

```shell
amap -bvq <TargetIP> <Port>		# Trigger then catch banner
amap -d <TargetIP> <Port>		# Trigger then dump data
```

​	