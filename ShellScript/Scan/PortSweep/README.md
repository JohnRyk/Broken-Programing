## nc

```shell
#sweep port from 1 to 1024
nc -nv 192.168.1.1 -z 1-1024

#Scanning target in list from port 21 to 25:
for i in {1,2,24,56,120}; do nc -vv -n -w 1 192.168.1.$i 21-25 -z; done
```

