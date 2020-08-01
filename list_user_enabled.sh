#!/bin/sh

source ./util.sh

list_user_enabled () {
	USER_LIST=( `samba-tool user list` )
	for x in ${USER_LIST[@]}
	do
		USER_DESC=`user_description ${x}`
		if [ "`./is_user_disabled.sh ${x}`" = "ENABLED" ]
		then
			echo ${x} \(${USER_DESC}\)
		fi
	done
}

list_user_enabled
