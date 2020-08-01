#!/bin/sh

user_address () {
        echo `./ldapsearch_uid.sh ${1} | grep mail | awk '{print $2}'`
}

user_description () {
	echo `./ldapsearch_uid.sh ${1} | grep description | awk '{for(i=2;i<NF;i++){printf("%s%s",$i,OFS=" ")}print $NF}'`
}

user_lastlogontimestamp () {
        echo `./ldapsearch_uid.sh ${1} | grep lastLogonTimestamp | awk '{print $2}'`
}

user_pwdlastset() {
        echo `./ldapsearch_uid.sh ${1} | grep pwdLastSet | awk '{print $2}'`
}
