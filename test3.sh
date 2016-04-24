#!/bin/bash


## string split ###
# str="1,2,3"
# arr=(${str//,/ })
# len=${#arr[@]}
# for((i=0;i<$len;i++)); do
# 	echo ${arr[$i]}
# done


#### sql ####
results=`mysql \
-h localhost \
-udev -ppassword \
-N -D adnet \
-e "SELECT name FROM ad Limit 0,5"`
