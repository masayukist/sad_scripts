#!/bin/sh

dn () {
	echo `./ldapsearch_uid.sh ${1} | grep dn | awk '{for(i=2;i<NF;i++){printf("%s%s",$i,OFS=" ")}print $NF}'`
}
