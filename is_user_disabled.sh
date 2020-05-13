#!/bin/sh

user_ldap_prop () {
	echo `./ldapsearch_uid.sh ${1} | grep ${2} | awk '{print $2}'`
}

UAC_NUMBER=`user_ldap_prop ${1} userAccountControl`

if [ "$UAC_NUMBER" = "512" ]
then
	echo ENABLED
	exit
fi

if [ "$UAC_NUMBER" = "514" ]
then
	echo DISABLED
	exit
fi

echo UNKNOWN
