#!/bin/sh +x

. ./config.sh

UID_NUMBER=`./include/nextid.sh`
echo User ID will be set to $UID_NUMBER
GID_NUMBER=${START_GID}

echo -n "${0}: login name? "
read USERNAME
echo -n "${0}: sur(family) name? "
read SUR_NAME
echo -n "${0}: given(first) name? "
read GIVEN_NAME
echo -n "${0}: mail address? "
read MAIL

PASSWORD=`./include/passgen.sh`

echo -----------------
echo New User: $USERNAME
echo Full Name: $GIVEN_NAME $SUR_NAME
echo User ID: $UID_NUMBER
echo Initial password is ${PASSWORD}
echo -----------------

. ./include/confirm.sh

samba-tool user create ${USERNAME} ${PASSWORD} \
    --must-change-at-next-login \
    --surname="${SUR_NAME}" \
    --given-name="${GIVEN_NAME}" \
    --description="${GIVEN_NAME} ${SUR_NAME}" \
    --mail-address=$MAIL \
    --nis-domain="${DOMAIN}" \
    --uid=${USERNAME} \
    --uid-number=${UID_NUMBER} \
    --gid-number=${GID_NUMBER} \
    --login-shell=/bin/bash \
    --unix-home=${HOME_DIR_BASE}/${USERNAME}

if test $? -ne 0
then
    echo E-mail is not sent.
    exit
fi

echo -e \
    "Dear ${GIVEN_NAME} ${SUR_NAME},\n" \
    "\n" \
    "Your account name and initial password are shown as below.\n" \
    "\n" \
    "username: ${USERNAME}\n" \
    "password: ${PASSWORD}\n" \
    "\n" \
    "If you receive this mail, please login to ${LOGIN_HOST} \n"\
    "by ssh protocol with the account written in this mail,\n" \
    "and try to update the initial password to new one.\n" \
    "\n" \
    "Note:\n" \
    "This is the authentication system of the domain ${DOMAIN},\n" \
    "expressed by ${DOMAIN_NTSTYLE} in a NT domain style.\n" \
    "This mail is automatically sent. Please do not reply to this mail.\n" \
    "\n" \
    "Regards,\n" \
    "Domain Admins\n" | mail -s "Notification of a new account on ${DOMAIN}" -r ${MAIL_FROM} -b ${MAIL_BCC} ${MAIL}

# confirm the account
while :
do
    id ${USERNAME}
    if [ $? -eq 0 ]; then
	echo ${USERNAME}\'s authentication information is updated.
	break
    fi
    echo waiting the update of ${USERNAME}\'s authentication information ... retry after 5 seconds
    sleep 5
done
