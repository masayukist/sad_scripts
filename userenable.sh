#!/bin/sh

. ./config.sh

if [ ${1} ]
then
	/usr/local/samba/bin/samba-tool user enable ${1}
else
	echo specify username as an argument
fi
