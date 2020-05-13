#!/bin/sh

user_ldap_prop () {
	echo `./ldapsearch_uid.sh ${1} | grep ${2} | awk '{print $2}'`
}

list_ldap_prop () {
	USER_LIST=( `samba-tool user list` )
	for x in ${USER_LIST[@]}
	do
		echo -e ${x} "\t" `user_ldap_prop ${x} ${1}`
	done
}

list_ldap_prop ${1}
