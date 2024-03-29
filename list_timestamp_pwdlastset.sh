#!/bin/sh

source ./include/description.sh

list_user_enabled () {
	USER_LIST=( `samba-tool user list` )
	for x in ${USER_LIST[@]}
	do
		USER_DESC=`description ${x}`
		LOGON_TIMESTAMP=`./include/user_pwdlastset.sh ${x}`
		if [ "`./is_user_disabled.sh ${x}`" = "ENABLED" ]
		then
			echo ${LOGON_TIMESTAMP} ${x} \(${USER_DESC}\)
		fi
	done
}

list_user_enabled | tee list_timestamp_pwdlastset.log
