#!/bin/bash

list=`pacman -Sup 2> /dev/null`

if [ "$list" == "" ]; then
    count="~"
else
    count=`echo "$list" | wc -l`
    printf "%s %s \n" "UPD: ""$count"
fi