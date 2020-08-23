#!/bin/sh

source ./include/mail.sh
source ./include/description.sh

list_user_address_ml () {
	USER_LIST=( `samba-tool user list` )
	for x in ${USER_LIST[@]}
	do
		USER_ADDR=`mail ${x}`
		if [ "$USER_ADDR" = "" ]
		then
			continue
		fi
		if [ "`./is_user_disabled.sh ${x}`" = "DISABLED" ]
		then
			continue
		fi
		echo ${USER_ADDR},
	done
}

list_user_address_ml
