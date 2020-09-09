#!/bin/sh

. ./config.sh

MAX_ID=`./include/ldapsearch_head.sh uidNumber | grep ^uidNumber | awk '{if(m<$2) m=$2} END{print m}'`
echo `expr $MAX_ID + 1`
