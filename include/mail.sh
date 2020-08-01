#!/bin/sh

mail () {
        echo `./ldapsearch_uid.sh ${1} | grep mail | awk '{print $2}'`
}
