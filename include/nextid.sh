#!/bin/sh

. ./config.sh

USERS=`/usr/local/samba/bin/samba-tool user list`

MAX_ID=${START_UID}

for USER in $USERS
do
    ID=`id -u $USER 2>/dev/null`
    #ALL_USER_IDS="${ALL_USER_IDS[@]} $ID"

    if test $? -ne 0
    then
	continue
    fi

    if test ${MAX_ID} -lt ${ID}
    then
	MAX_ID=${ID}
    fi
done

echo `expr $MAX_ID + 1`
