#!/bin/sh

source ./include/mail.sh

echo -n ${0} "username? "
read USERNAME

mail $USERNAME
