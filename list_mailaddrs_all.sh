#!/bin/sh

source ./include/description.sh
source ./include/mail.sh

list_user_address_ml () {
	USER_LIST=( `samba-tool user list` )
	for x in ${USER_LIST[@]}
	do
		USER_ADDR=`mail ${x}`
		if [ "$USER_ADDR" = "" ]
		then
			continue
		fi
		echo ${PREFIX}${USER_ADDR}   \# ${x} \(`description ${x}`\)
	done
}

list_user_address_ml
