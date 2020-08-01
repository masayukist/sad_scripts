#!/bin/sh

source ./include/lastlogontimestamp.sh

LAST_LOGON_TIMESTAMP=`lastlogontimestamp ${1}`

if [ -z "${LAST_LOGON_TIMESTAMP}" ]
then
	echo NODATA 
	exit
fi

./include/convert_timestamp.py ${LAST_LOGON_TIMESTAMP}
