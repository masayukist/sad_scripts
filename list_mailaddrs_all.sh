#!/bin/sh

source ./util.sh

list_user_address_ml () {
	USER_LIST=( `samba-tool user list` )
	for x in ${USER_LIST[@]}
	do
		USER_ADDR=`user_address ${x}`
		if [ "$USER_ADDR" = "" ]
		then
			continue
		fi
		echo ${PREFIX}${USER_ADDR}   \# ${x} \(`user_description ${x}`\)
	done
}

list_user_address_ml
