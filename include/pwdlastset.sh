#!/bin/sh

pwdlastset() {
        echo `./ldapsearch_uid.sh ${1} | grep pwdLastSet | awk '{print $2}'`
}
