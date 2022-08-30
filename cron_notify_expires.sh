#!/bin/sh

cd `dirname $0`

source ./include/description.sh
source ./config.sh

send_expire_notify_mail() {
	export USERNAME=$1
	export USER_DESC=`description ${x}`
	eval "echo \"`cat templates/notify_expire_mail.txt`\"" > notify_expire_mail.tmp.txt
	LC_CTYPE=ja_JP.UTF-9 cat notify_expire_mail.tmp.txt | mailx -s "${EXPIRE_MAIL_TITLE}" -r ${MAIL_FROM} -b ${MAIL_BCC} ${EXPIRE_MAIL_TO}
	rm notify_expire_mail.tmp.txt
}

get_enable_user_expiration () {
	USER_LIST=( `samba-tool user list` )
	for x in ${USER_LIST[@]}
	do
		USER_DESC=`description ${x}`
		EXPIRE_TIMESTAMP=`./include/user_accountexpires.sh ${x}`
		if [ "`./is_user_disabled.sh ${x}`" = "DISABLED" ]; then
			continue
		fi
		if [ "$EXPIRE_TIMESTAMP" == "none" ]; then
			continue
		fi
		STATUS=`./include/is_timestamp_one_month_before.py ${EXPIRE_TIMESTAMP}`
		echo ${EXPIRE_TIMESTAMP} ${x} ${STATUS}
		if [ "${STATUS}" == "ONE_MONTH_BEFORE" ]; then
			send_expire_notify_mail ${x}
		fi
	done
}

get_enable_user_expiration > cron_notify_expires.log
