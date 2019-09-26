#!/bin/sh

echo " _______________________________"
echo "|                             |@"
echo "|   MySQL local Enumerator    |"
echo "|                        v:1.0|"
echo "|-----------------------------|"
echo "|                             |"
echo "|   Ops:                      |"
echo "|        1.get mysql info     |"
echo "|        2.query database     |"
echo "|                             |"
echo '\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/ '


HOSTNAME="127.0.0.1"
PORT="3306"
USERNAME="root"
PASSWORD=""
DBNAME=""
TABLENAME=""


function main(){
	echo "Choose your Option:"
	read option
	echo
	if [ "$option" ] ; then
		init
		if [ "$option" = "1" ] ; then
			get_info	
		elif [ "$option" = "2" ] ; then
			query_db
		fi	
	else
		echo
		echo "[-] Exited please choose your option !"
	fi
}


function init(){
	echo "[*] To specify an username (default: root): "	
	read input_uname
	if [ -n "$input_uname" ] ; then
		USERNAME=$input_uname
		echo
		echo "[+] Change username to $USERNAME"
		echo
	fi
	
	echo "[*] To specify a password for $USERNANE (default: None): "
	read input_passwd

	if [ -n "$input_passwd" ] ; then
		PASSWORD=$input_passwd
		echo
		echo "[+] Change password to $PASSWORD"
		echo
	fi
}


function get_info(){
	if [ $PASSWORD ] ; then
		# Try to get mysql info with password
		echo
		echo "[*] Trying login to local mysql using username: $USERNAME password: $PASSWORD ..."
		mysql -h $HOSTNAME -P $PORT -u $USERNAME -p $PASSWORD -e "SELECT version();SELECT now()" -vvv
		mysql -h $HOSTNAME -P $PORT -u $USERNAME -p $PASSWORD -e "show databases" -vvv	
	else
		# Get mysql info (no password)
		echo
		echo "[*] Trying login to local mysql using username: $USERNAME , without password..."
		mysql -h $HOSTNAME -P $PORT -u $USERNAME -e "SELECT version();SELECT now()" -vvv
		mysql -h $HOSTNAME -P $PORT -u $USERNAME -e "show databases" -vvv
	fi
}


function dump_data(){
	echo
	echo "[*] Give the table name that your want to query: "
	read tb_name
	if [ $tb_name ] ; then
		TABLENAME=$tb_name
		query_sql="select * from ${TABLENAME}"
		if [ $PASSWORD ] ; then
			mysql -h $HOSTNAME -P $PORT -u $USERNAME -p $PASSWORD $DBNAME -e "${query_sql}"
		else
			mysql -h $HOSTNAME -P $PORT -u $USERNAME $DBNAME -e "${query_sql}"
		fi
	else
		echo
		"[-] Error: table name cannot be none!"
	fi
}


function query_db(){
	# Try to query database
	echo
	echo "[*] Give a database name which you select: "
	read db_name
	if [ $db_name ] ; then
		DBNAME=$db_name
		if [ $PASSWORD ] ; then	
			echo "[*] Trying to list tables in $DBNAME using username: $USERNAME password: $PASSWORD ..."
			mysql -h $HOSTNAME -P $PORT -u $USERNAME -p $PASSWORD $DBNAME -e "show tables" -vvv
		else
			echo "[*] Trying to list tables in $DBNAME using username: $USERNAME , without password..."
			mysql -h $HOSTNAME -P $PORT -u $USERNAME $DBNAME -e "show tables" -vvv
		fi
	else
		echo
		"[-] Error: database name cannot be none!"
	fi

	while true
	do
		echo	
		echo "[*] Do you want to dump data from table?        [y/n]"
		read yn
		if [ "$yn" = "y" ] ; then
			dump_data
		elif [ "$yn" = "n" ] ; then
			echo
			echo "[+] User manual exit!"
			exit 0
		fi
	done
}

main
