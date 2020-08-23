#!/bin/sh

user_property () {
        echo `./ldapsearch_uid.sh ${1} | grep ${2} | awk '{print $2}'`
}
