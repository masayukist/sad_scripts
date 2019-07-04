#!/bin/sh

user_address () {
	echo `./ldapsearch_uid.sh ${1} | grep mail | awk '{print $2}'`
}

list_user_address () {
	USER_LIST=( `samba-tool user list` )
	for x in ${USER_LIST[@]}
	do
		echo `user_address ${x}`
	done
}

list_user_address | sort | uniq
