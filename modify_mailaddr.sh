#!/bin/sh

source ./config.sh
source ./include/mail.sh
source ./include/dn.sh

echo -n "${0}: login name? "
read USERNAME

echo ${0}: current mail address is `mail $USERNAME`

echo -n "${0}: new mail address? "
read MAILADDR

DN=`dn ${USERNAME}`

LDIF=./mail.ldif

echo dn: ${DN} > ${LDIF}
echo changetype: modify >> ${LDIF}
echo replace: mail >> ${LDIF}
echo mail: ${MAILADDR} >> ${LDIF}

echo ----
cat ${LDIF}
echo ----

source ./include/confirm.sh

LDAPTLS_REQCERT=never ldapmodify -H ${LDAP_URI} -x -D ${LDAP_ADMIN} -w ${LDAP_ADMIN_PASS} -f ${LDIF}

rm ${LDIF}
