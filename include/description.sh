#!/bin/sh

description () {
	echo `./ldapsearch_uid.sh ${1} | grep description | awk '{for(i=2;i<NF;i++){printf("%s%s",$i,OFS=" ")}print $NF}'`
}
