#!/bin/sh

lastlogontimestamp () {
        echo `./ldapsearch_uid.sh ${1} | grep lastLogonTimestamp | awk '{print $2}'`
}
