# nc

​	local port redirection:

```shell
#redirect local 3389 to 443
nc -nvlp 3389 -c 'nc -nvlp 443'
```























​	