#!/bin/sh


source ./config.sh
source ./include/dn.sh

echo -n "${0}: login name? "
read USERNAME


echo -n "${0}: new gidNumber? "
read GID_NUMBER

DN=`dn ${USERNAME}`

LDIF=./descname.ldif

clearline () {
	echo > ${LDIF}
}

addline () {
	echo ${@} >> ${LDIF}
}

clearline
addline dn: ${DN}
addline changetype: modify

addline replace: gidNumber
addline gidNumber: ${GID_NUMBER}

echo ----
cat ${LDIF}
echo ----

source ./include/confirm.sh

LDAPTLS_REQCERT=never ldapmodify -H ${LDAP_URI} -x -D ${LDAP_ADMIN} -w ${LDAP_ADMIN_PASS} -f ${LDIF}

rm ${LDIF}
