#!/bin/sh

. ./config.sh

echo -n "Remove user > "
read USERNAME

. ./include/confirm.sh

samba-tool user delete ${USERNAME}
