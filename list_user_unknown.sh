#!/bin/sh

source ./util.sh

list_user_disabled () {
	USER_LIST=( `samba-tool user list` )
	for x in ${USER_LIST[@]}
	do
		if [ "`./is_user_disabled.sh ${x}`" = "UNKNOWN" ]
		then
			echo ${x} \(`user_description ${x}`\)
		fi
	done
}

list_user_disabled
