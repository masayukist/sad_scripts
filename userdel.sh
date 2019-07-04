#!/bin/sh

. ./config.sh

echo -n "Remove user > "
read USERNAME

. ./include/confirm.sh

/usr/local/samba/bin/samba-tool user delete ${USERNAME}
