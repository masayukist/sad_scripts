#!/bin/sh

echo clearing sssd\'s cache...

systemctl stop sssd
sss_cache -E
systemctl start sssd
