#!/bin/sh

source ./util.sh

LAST_LOGON_TIMESTAMP=`user_lastlogontimestamp ${1}`

if [ -z "${LAST_LOGON_TIMESTAMP}" ]
then
	echo No data
	exit
fi

./include/convert_timestamp.py ${LAST_LOGON_TIMESTAMP}
