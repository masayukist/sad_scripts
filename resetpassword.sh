#!/bin/sh

. ./config.sh

echo -n "${0}: login name? "
read USERNAME
echo -n "${0}: mail address? "
read MAIL

. ./include/confirm.sh

PASSWORD=`./include/passgen.sh`
samba-tool user setpassword ${USERNAME} --newpassword=${PASSWORD} --must-change-at-next-login

if test $? -ne 0
then
    echo Change password failed. E-mail is not sent.
    exit
fi

echo -e \
    "Dear user ${USERNAME},\n" \
    "\n" \
    "Your account name and initial password are reset as below.\n" \
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
    "This mail is automatically sent.\n" \
    "\n" \
    "Regards,\n" \
    "${MAIL_BODY_FROM}\n" | mail -s "Notification of a new password for the domain ${DOMAIN}" -r ${MAIL_FROM} -b ${MAIL_BCC} ${MAIL}

echo Reset password is ${PASSWORD}
echo E-mail is sent to ${MAIL}
