#!/bin/sh


source ./config.sh
source ./include/dn.sh

echo -n "${0}: login name? "
read USERNAME


echo -n "${0}: sur(family) name "
read SURNAME
echo -n "${0}: given(first) name "
read GIVENNAME

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

addline replace: cn
addline cn: ${GIVENNAME} ${SURNAME}

addline -
addline replace: sn
addline sn: ${SURNAME}

addline -
addline replace: description
addline description: ${GIVENNAME} ${SURNAME}

addline -
addline replace: givenName
addline givenName: ${GIVENNAME}

addline -
addline replace: displayName
addline displayName: ${GIVENNAME} ${SURNAME}

addline -
addline replace: name
addline name: ${GIVENNAME} ${SURNAME}

addline -
addline replace: distinguishedName
addline distinguishedName: CN=${GIVENNAME} ${SURNAME},CN=Users,${LDAP_DN}

echo ----
cat ${LDIF}
echo ----

source ./include/confirm.sh

LDAPTLS_REQCERT=never ldapmodify -H ${LDAP_URI} -x -D ${LDAP_ADMIN} -w ${LDAP_ADMIN_PASS} -f ${LDIF}

rm ${LDIF}
