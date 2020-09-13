#!/bin/sh

. ./config.sh

echo -n "${0}: login name? "
read USERNAME

. ./include/description.sh
. ./include/mail.sh

DESC_NAME=`description ${USERNAME}`
MAIL_ADDR=`mail ${USERNAME}`

echo -----------------
echo User Name: ${USERNAME}
echo Full Name: ${DESC_NAME}
echo Mail Addr: ${MAIL_ADDR} 
echo -----------------

. ./include/confirm.sh

PASSWORD=`./include/passgen.sh`

samba-tool user setpassword ${USERNAME} --newpassword=${PASSWORD} --must-change-at-next-login

if test $? -ne 0
then
    echo Change password failed. E-mail is not sent.
    exit
fi

eval "echo \"`cat templates/pass_gen_mail.txt`\"" > reset_password_mail.tmp.txt

LC_CTYPE=ja_JP.UTF-9 cat reset_password_mail.tmp.txt | mailx -s "Notification of a new password for the domain ${DOMAIN}" -r ${MAIL_FROM} -b ${MAIL_BCC} ${MAIL_ADDR}

rm reset_password_mail.tmp.txt

echo Reset password is ${PASSWORD}
echo E-mail is sent to ${MAIL_ADDR}
