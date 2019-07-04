#!/bin/sh

. ./config.sh

echo -n "group name? > "
read GROUP_NAME
GID=`./include/nextgid.sh`

echo --------------
echo A new group will be generated.
echo group name: ${GROUP_NAME}
echo group id  : ${GID}
echo --------------

. ./include/confirm.sh

samba-tool group add --nis-domain=${DOMAIN} --gid-number=${GID} ${GROUP_NAME}
