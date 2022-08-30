#!/bin/sh

source ./include/description.sh

list_user_enabled () {
	USER_LIST=( `samba-tool user list` )
	for x in ${USER_LIST[@]}
	do
		USER_DESC=`description ${x}`
		EXPIRE_TIMESTAMP=`./include/user_accountexpires.sh ${x}`
		if [ "`./is_user_disabled.sh ${x}`" = "ENABLED" ]
		then
			echo ${EXPIRE_TIMESTAMP} ${x} \(${USER_DESC}\)
		fi
	done
}

list_user_enabled | tee list_timestamp_expires.log
