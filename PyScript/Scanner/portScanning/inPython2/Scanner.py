import optparse
from socket import *

def connScan(Host,Port):
    try:
        con = socket(AF_INET,SOCK_STREAM)
        con.connect((Host,Port))
        print '[+] %d tcp open' % Port
        con.close()
    except:
        print '[-] %d tcp closeed' % Port

def portScan(Host,Port):
    try:
        IP = gethostbyname(Host)
    except:
        print ''
        return
    try:
        HostName = gethostbyaddr(IP)
        print ''

parser = optparse.OptionParser('usage %prog - H <target host> -p <target port>')
parser.add_option('-H',dest='Host',type='string',help='specify target host')
parser.add_option('-p',dest='Port',type='int',help='specify target port')

(options,args)=parser.parse_args()
Host = options.Host
Port = options.Port

if(Host=None)|(Port=None):
    print parser.usage
    exit(0)
