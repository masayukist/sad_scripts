#!/bin/sh

echo -n "Is it OK ? (\"ok\" or press any keys) > "
read ANSWER

if [ "$ANSWER" != "ok" ] ; then
	echo "cancel"
	exit
fi
