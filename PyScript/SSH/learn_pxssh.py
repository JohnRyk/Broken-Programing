import optparse
import pxssh

def send_command(s,cmd):
    '''sending presetting command'''
    s.sendline(cmd)
    s.prompt()
    print(s.before)
def connect(target,uname,passwd):
    '''connect remote host using ssh'''
    try:
        s = pxssh.pxssh()
        s.login(host,user,passwd)
        return s
    except:
        print("[-] Error, Cannot connect to the remote host")
        exit(0)


parser = optparse.OptionParser("Usage %prog -t "+"<Target IP>")
parser.add_option('-t',dest='target',type='string')
(options,args) = parser.parse_args()

target = options.target

if (target == None):
    print(parser.usage)
    exit(0)

username = input("Username:")
password = input("Password:")
s = connect(target,username,password)
sned_command(s,'hostname ;whoami ;id ;ifconfig')

