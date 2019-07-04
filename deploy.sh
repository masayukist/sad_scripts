#!/bin/sh

. ./config.sh

echo samba-tool domain provision --use-rfc2307 \
	--realm `tr '[a-z]' '[A-Z]'  <<< ${DOMAIN}` \
	--domain ${DOMAIN_NTSTYLE} \
	--server-role dc \
	--dns-backend=SAMBA_INTERNAL \
	--adminpass=${ADMIN_PASS}
