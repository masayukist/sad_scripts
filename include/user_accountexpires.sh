#!/bin/sh

source ./include/user_property.sh

ACCOUNT_EXPIRES=`user_property ${1} accountExpires`

if [ "${ACCOUNT_EXPIRES}" = "9223372036854775807" ]
then
	echo none
	exit
fi

if [ "${ACCOUNT_EXPIRES}" = "0" ]
then
	echo none
	exit
fi

if [ -z "${ACCOUNT_EXPIRES}" ]
then
	echo none
	exit
fi

./include/convert_timestamp.py ${ACCOUNT_EXPIRES}
