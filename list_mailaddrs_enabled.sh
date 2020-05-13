#!/bin/sh

user_address () {
	echo `./ldapsearch_uid.sh ${1} | grep mail | awk '{print $2}'`
}

list_user_address () {
	USER_LIST=( `samba-tool user list` )
	for x in ${USER_LIST[@]}
	do
		`user_address ${x}`
	done
}

list_user_address_ml () {
	USER_LIST=( `samba-tool user list` )
	for x in ${USER_LIST[@]}
	do
		USER_ADDR=`user_address ${x}`
		if [ "$USER_ADDR" = "" ]
		then
			continue
		fi
		if [ "`./is_user_disabled.sh ${x}`" = "DISABLED" ]
		then
			PREFIX="# "
		else
			PREFIX=""
		fi
		echo \# ${x}
		echo ${PREFIX}${USER_ADDR}
	done
}

#list_user_address | sort | uniq | sed  '/^$/d'

list_user_address_ml
