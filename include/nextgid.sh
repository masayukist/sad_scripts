#!/bin/sh

. ./config.sh

MAX_ID=${START_GID}

while [ 1 ]
do
	getent group ${MAX_ID} > /dev/null 2>&1
	if [ $? -ne 0 ]
	then
		break
	fi
	MAX_ID=`expr ${MAX_ID} + 1`
done

echo ${MAX_ID} 
