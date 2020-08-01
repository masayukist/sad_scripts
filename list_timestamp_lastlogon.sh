#!/bin/sh

source ./util.sh

list_user_enabled () {
	USER_LIST=( `samba-tool user list` )
	for x in ${USER_LIST[@]}
	do
		USER_DESC=`user_description ${x}`
		LOGON_TIMESTAMP=`./include/user_lastlogontimestamp.sh ${x}`
		if [ "`./is_user_disabled.sh ${x}`" = "ENABLED" ]
		then
			echo ${LOGON_TIMESTAMP} ${x} \(${USER_DESC}\)
		fi
	done
}

list_user_enabled
