#!/bin/sh

. ./config.sh

if [ ${1} ]
then
	samba-tool user disable ${1}
else
	echo specify username as an argument
fi
