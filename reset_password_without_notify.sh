#!/bin/sh

. ./config.sh

echo -n "${0}: login name? "
read USERNAME

. ./include/description.sh

PASSWORD=`./include/passgen.sh`
DESC_NAME=`description ${USERNAME}`

echo ---------
echo description: $DESC_NAME
echo ---------

. ./include/confirm.sh

samba-tool user setpassword ${USERNAME} --newpassword=${PASSWORD} 
