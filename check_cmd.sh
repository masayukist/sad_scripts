#!/bin/sh

commands=(
mail
samba-tool
awk
grep
sed
ldapsearch
sss_cache
systemctl
pwgen
getent
id
)

for x in ${commands[@]}
do
	which ${x} > /dev/null 2>&1
	if [ $? != 0 ]; then
		echo ERROR: check existence of a command ${x}
		exit
	fi
done
