#!/bin/bash

user_ldap_prop () {
	echo `./ldapsearch_uid.sh ${1} | grep ${2} | awk '{print $2}'`
}

UAC_NUMBER=`user_ldap_prop ${1} userAccountControl`

if [ -z "$UAC_NUMBER" ]
then
	echo UNKNOWN
	exit
fi


DISABLED_FLAG=$(( ${UAC_NUMBER} & 2 ))


if [ "$DISABLED_FLAG" = "0" ]
then
	echo ENABLED
	exit
fi

if [ "$DISABLED_FLAG" = "2" ]
then
	echo DISABLED
	exit
fi
